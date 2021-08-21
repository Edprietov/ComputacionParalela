//Programa que implementa el algoritmo de aplicación de algunos filtros sobre una imagen
#include <iostream>
#include <opencv2/opencv.hpp>
#include <cuda.h>
#include <cuda_runtime.h>
#include <ctime>
#include <fstream>

using namespace cv;
using namespace std;


__global__
void saxpy()
{

}

//Prototipos de funciones
Mat lectura_imagen(String nombre_imagen);
void filtro_amarillo(String nombre);
ofstream archivo;


int main(int argc, char **argv)
{
    filtro_amarillo(argv[1]);
    waitKey(0);
    return 0;
}

//***filtro2*****
void filtro_amarillo(String nombre)
{
    int pixel = 0;
    unsigned tiempo_final, tiempo_inicial;
    Mat imagen ;

        imagen = lectura_imagen(nombre);
        tiempo_inicial = clock();

        for (int y = 0; y < imagen.rows; y++)
        {
            for (int x = 0; x < imagen.cols; x++)
            {
                Vec3b color = imagen.at<Vec3b>(y, x);
                int azul = (int)color.val[0];
                int verde = (int)color.val[1];
                int rojo = (int)color.val[2];
                int promedio = (int)((azul + verde + rojo) / 3);

                color.val[0] = promedio;
                color.val[1] = promedio;
                color.val[2] = promedio;
             
                imagen.at<Vec3b>(y, x) = color;
            }
        }
    imwrite("filtradacolor" + nombre, imagen);
}

//*****Procedimiento que lee la imagen******
Mat lectura_imagen(String nombre_imagen)
{
    // Lectura de la imagen
    Mat imagen = imread("./../Assets/"+nombre_imagen, 1);
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
