#include <mpi.h>
#include <iostream>
#include <opencv2/opencv.hpp>
#include <ctime>
#include <fstream>
#include <sys/time.h>
#include <unistd.h>

using namespace cv;
using namespace std;

//Prototipos de funciones
Mat lectura_imagen(String nombre_imagen);
void iniciar_filtro(String nombre, int numfiltro, int hilo, int total_hilos);
bool filtro(int rojo, int verde, int azul, int filtro_a_aplicar);
ofstream archivo;

int main(int argc, char *argv[])
{
    int proceso;
    int total_hilos;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &total_hilos);
    MPI_Comm_rank(MPI_COMM_WORLD, &proceso);

    //orden argumentos nombre, numero filtro, hilo ejecucion,numero hilos totales
    iniciar_filtro(argv[1], 1, proceso, total_hilos);

    MPI_Finalize();
    return 0;
}

void iniciar_filtro(String nombre, int numfiltro, int hilo, int total_hilos)
{
    MPI_Status status;

    if (total_hilos == 1)
    {
        Mat imagen = lectura_imagen(nombre);
        int espacio = imagen.cols / total_hilos;
        int inicio = hilo * espacio;
        int fin;
        (hilo == total_hilos - 1) ? fin = imagen.cols : fin = inicio + espacio;
        for (int y = 0; y < imagen.rows; y++)
        {
            for (int x = inicio; x < fin; x++)
            {
                Vec3b color = *(&(imagen.at<Vec3b>(y, x)));
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
                *(&(imagen.at<Vec3b>(y, x))) = color;
            }
        }
    }
    else
    {
        if (hilo == 0)
        {
            Mat imagen = lectura_imagen(nombre);
            for (int i = 1; i < total_hilos; i++)
            {
                MPI_Send(&imagen, 1, MPI_INT, i, 0, MPI_COMM_WORLD);
            }

            cv::Rect myROI(10, 10, 100, 100);
            cv::Mat croppedImage = imagen(myROI);
            String nombre_archivo = "./Resultados/filtro" + to_string(numfiltro) + "__nombre_ " + nombre;
            imwrite(nombre_archivo, imagen);
        }
        else
        {   
            Mat imagen;
            MPI_Recv(&imagen, 1, MPI_INT, MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, &status);
            int espacio = imagen.cols / total_hilos;
            int inicio = hilo * espacio;
            int fin;
            (hilo == total_hilos - 1) ? fin = imagen.cols : fin = inicio + espacio;
            cout << "wi"<< endl;
            cout << imagen.data <<endl;
            for (int y = 0; y < imagen.rows; y++)
            {
                for (int x = inicio; x < fin; x++)
                {
                    Vec3b color = *(&(imagen.at<Vec3b>(y, x)));
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
                    *(&(imagen.at<Vec3b>(y, x))) = color;
                }
            }
        }
    }
}

bool filtro(int rojo, int verde, int azul, int filtro_a_aplicar)
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

/*****Procedimiento que lee la imagen******/
Mat lectura_imagen(String nombre_imagen)
{
    // Lectura de la imagen
    Mat imagen = imread("./../Assets/" + nombre_imagen, 1);
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