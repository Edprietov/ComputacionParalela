//Programa que implementa el algoritmo de aplicación de algunos filtros sobre una imagen usando CUDA
#include <stdio.h>
#include <iostream>
#include <opencv2/opencv.hpp>
#include <cuda.h>
#include <cuda_runtime.h>

//Namespaces.
using namespace std;
using namespace cv;

//Filtro que se aplica.
__device__ bool aplicar_filtro(int rojo, int verde, int azul, int filtro_a_aplicar)
{

	switch (filtro_a_aplicar)
	{
		//FILTRO AMARILLO
	case 1:
		if (rojo > 200 && verde > 100 && azul < 85)
		{
			return true;
		}
		break;
		//FILTRO AZUL
	case 2:
		if (rojo < 80 && verde > 130 && azul > 170)
		{
			return true;
		}
		break;
		//FILTRO VERDE
	case 3:
		if (rojo < 91 && verde > 159 && azul < 91)
		{
			return true;
		}
		break;
	default:
		break;
	}
	return false;
}

__device__ int filtro(const int *imagen, int x, int y, int alto, int num_filtro)
{

	int n = imagen[y + x * alto];
	int rojo = 0, verde = 0, azul = 0, promedio = 0;
	azul += (n % 1000);
	verde += (n / 1000) % 1000;
	rojo += (n / 1000000) % 1000;
	promedio = ((azul + verde + rojo) / 3);
	if (!aplicar_filtro(rojo, verde, azul, num_filtro))
	{
		azul = promedio;
		verde = promedio;
		rojo = promedio;
	}
	return (rojo * 1000000) + (verde * 1000) + azul;
}

//Función que ejecuta cada hilo.
__global__ void hilo_filtro(const int *d_imagen_rgb, const int ancho, const int alto, const int total_hilos, int *d_imagen_filtrada, int num_filtro)
{

	int id = blockDim.x * blockIdx.x + threadIdx.x;
	int fila_inicial = id * (alto / total_hilos);
	int fila_final = (id + 1) * (alto / total_hilos);
	if (id < alto)
	{
		for (int i = 0; i < ancho; i++)
		{
			for (int j = fila_inicial; j < fila_final; j++)
			{
				d_imagen_filtrada[j + i * alto] = filtro(d_imagen_rgb, i, j, alto, num_filtro);
			}
		}
	}
}

//Prototipos de funciones
Mat lectura_imagen(String nombre_imagen);

int main(int argc, char **argv)
{

	//Variables.
	char *nombre_imagen;
	Mat imagen, imagen_filtrada;
	int num_hilos, num_bloques, num_filtro, iteracion;

	//Recibir argumentos.
	nombre_imagen = argv[1];
	num_hilos = atoi(argv[2]);
	num_filtro = atoi(argv[3]);
	iteracion = atoi(argv[4]);

	if (argc != 5)
	{
		cout << "Numero incorrecto de argumentos.\n";
		return -1;
	}

	//Leer imagen
	imagen = lectura_imagen(nombre_imagen);

	//Inicializar variables
	int ancho = imagen.cols;
	int alto = imagen.rows;
	imagen_filtrada = imagen.clone();
	cudaError_t err = cudaSuccess;

	//Malloc host
	int num_elementos = ancho * alto;
	size_t size = num_elementos * sizeof(int);
	int *h_imagen_rgb = (int *)malloc(size);
	int *h_imagen_filtrada = (int *)malloc(size);

	//Imagen a un vector 3D
	int aux = 0;
	for (int i = 0; i < ancho; i++)
	{
		for (int j = 0; j < alto; j++)
		{
			h_imagen_rgb[aux] = imagen.at<Vec3b>(j, i)[0];
			h_imagen_rgb[aux] += imagen.at<Vec3b>(j, i)[1] * 1000;
			h_imagen_rgb[aux] += imagen.at<Vec3b>(j, i)[2] * 1000000;
			aux++;
		}
	}

	//Reserva de memoria en el dispositivo
	//Imagen
	int *d_imagen_rgb = NULL;
	err = cudaMalloc((void **)&d_imagen_rgb, size);
	if (err != cudaSuccess)
	{
		cout << "Error separando espacio imagen normal en GPU " << cudaGetErrorString(err) << endl;
		return -1;
	}
	//Resultado
	int *d_imagen_filtrada = NULL;
	err = cudaMalloc((void **)&d_imagen_filtrada, size);
	if (err != cudaSuccess)
	{
		cout << "Error separando espacio imagen filtrada en GPU " << cudaGetErrorString(err) << endl;
		return -1;
	}

	//Copia de imagen desde el host al dispositivo
	err = cudaMemcpy(d_imagen_rgb, h_imagen_rgb, size, cudaMemcpyHostToDevice);
	if (err != cudaSuccess)
	{
		cout << "Error copiando datos a GPU " << cudaGetErrorString(err) << endl;
		return -1;
	}

	//Lanzar kernel GPU
	num_bloques = (alto + num_hilos - 1) / num_hilos;
	hilo_filtro<<<num_bloques, num_hilos>>>(d_imagen_rgb, ancho, alto, alto, d_imagen_filtrada, num_filtro);
	err = cudaGetLastError();
	if (err != cudaSuccess)
	{
		cout << "Fallo al lanzar Kernel de GPU " << cudaGetErrorString(err) << endl;
		return -1;
	}

	//Copiar de GPU a CPU
	err = cudaMemcpy(h_imagen_filtrada, d_imagen_filtrada, size, cudaMemcpyDeviceToHost);
	if (err != cudaSuccess)
	{
		cout << "Error copiando desde GPU a CPU " << cudaGetErrorString(err) << endl;
		return -1;
	}

	//Escribir imagen difuminada.
	aux = 0;
	for (int i = 0; i < ancho; i++)
	{
		for (int j = 0; j < alto; j++)
		{
			imagen_filtrada.at<Vec3b>(j, i)[0] = (unsigned char)((h_imagen_filtrada[aux]) % 1000);
			imagen_filtrada.at<Vec3b>(j, i)[1] = (unsigned char)((h_imagen_filtrada[aux] / 1000) % 1000);
			imagen_filtrada.at<Vec3b>(j, i)[2] = (unsigned char)((h_imagen_filtrada[aux] / 1000000) % 1000);
			aux++;
		}
	}

	if (num_hilos == 1024 && iteracion == 15)
	{
		String nombre_archivo = "./Resultados/filtro_" + to_string(num_filtro) + "_";
		imwrite(nombre_archivo += nombre_imagen, imagen_filtrada);
	}

	//Liberar espacio
	err = cudaFree(d_imagen_rgb);
	if (err != cudaSuccess)
	{
		cout << "Error liberando memoria de imagen normal " << cudaGetErrorString(err) << endl;
		return -1;
	}

	err = cudaFree(d_imagen_filtrada);
	if (err != cudaSuccess)
	{
		cout << "Error liberando memoria de imagen difuminada " << cudaGetErrorString(err) << endl;
		return -1;
	}

	free(h_imagen_rgb);
	free(h_imagen_filtrada);
	return 0;
}

/*****Procedimiento que lee la imagen******/
Mat lectura_imagen(String nombre_imagen)
{
	// Lectura de la imagen
	Mat imagen = imread("./Assets/" + nombre_imagen, 1);

	// Manejo de error en caso de que no sea encontrada la imagen
	if (imagen.empty())
	{
		cout << "Archivo de imagen "
			 << "No encontrado" << endl;
		cin.get();
		return imagen;
	}
	return imagen;
}
