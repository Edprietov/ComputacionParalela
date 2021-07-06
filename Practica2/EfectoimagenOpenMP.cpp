// Programa que implementa el algoritmo de aplicación de algunos filtros sobre una imagen
#include <iostream>
#include <opencv2/opencv.hpp>
#include <omp.h>
#include <ctime>
#include <fstream>
#include <sys/time.h>
#include <unistd.h>

using namespace cv;
using namespace std;



//Prototipos de funciones
Mat lectura_imagen(String nombre_imagen);
void iniciar_filtro(String nombre, int  numfiltro, int hilos);
bool filtro(int rojo, int verde, int azul, int filtro_a_aplicar);
ofstream archivo;

//definicion global del filtro a utilizar

int main(int argc, char **argv)
{
    //orden argumentos nombre, numero filtro, numero hilos
    iniciar_filtro(argv[1], atoi(argv[2]), atoi(argv[3]));
    ////// COLOCAR ARGUMENTO 3 /////
    //filtro_a_aplicar = argv[3]
    return 0;
}

bool filtro(int rojo, int verde, int azul, int filtro_a_aplicar)
{

    switch (filtro_a_aplicar)
    {
        //FILTRO AMARILLO
    case 1:
        if (rojo > 200 && verde >  100 && azul < 85)
        {
            return true;
        }
        break;
        //FILTRO AZUL
    case 2:
        if (rojo <  80 && verde > 130 && azul > 170)
        {
            return true;
        }
        break;
        //FILTRO VERDE
    case 3:
        if (rojo <  91 && verde > 159 && azul < 91)
        {
            return true;
        }
        break;
    default:
        break;
    }
    return false;
}

//***filtro2*****
void iniciar_filtro(String nombre, int numfiltro, int hilos)
{   
    int pixel = 0;
    short veces = 0;
    Mat imagen = lectura_imagen(nombre);

    int cols = imagen.cols;
    int rows = imagen.rows;
    int espacio = cols / hilos;

    

    //Zona paralelizable
    omp_set_num_threads(hilos);
    #pragma omp parallel 
    {
        int id = omp_get_thread_num();
        int nthreads = hilos;
        int inicio = id * espacio;
        int fin;
        

        if (id == hilos - 1)
        {
            fin = cols;
        }
        else
        {
            fin = inicio + espacio;
        }

            // Aplicacion del filtro sobre la imagen
        for (int y = 0; y < rows; y++)
        {
            for (int x = inicio; x < fin; x++)
            {
                Vec3b color = *(& (imagen.at<Vec3b>(y, x)));
                int azul = (int)color.val[0];
                int verde = (int)color.val[1];
                int rojo = (int)color.val[2];
                int promedio = (int)((azul + verde + rojo) / 3);

                if (filtro(rojo, verde, azul, numfiltro))
                {
                    color.val[0] = azul;
                    color.val[1] = verde;
                    color.val[2] = rojo;
                }
                else
                {
                    color.val[0] = promedio;
                    color.val[1] = promedio;
                    color.val[2] = promedio;
                }
                *(& (imagen.at<Vec3b>(y, x))) = color;
            }
        }
    }

   
    if (hilos == 16)
    {   
        cv::Rect myROI(10, 10, 100, 100);
        cv::Mat croppedImage = imagen(myROI);
        String nombre_archivo = "./Resultados/filtro" + to_string(numfiltro) + "__nombre_ " + nombre;
        imwrite(nombre_archivo, imagen);
    }
}
/*****Procedimiento que lee la imagen******/
Mat lectura_imagen(String nombre_imagen)
{
    // Lectura de la imagen
    Mat imagen = imread("./Assets/"+nombre_imagen, 1);

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
