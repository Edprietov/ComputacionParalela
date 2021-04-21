// Programa que implementa el algoritmo de aplicación de algunos filtros sobre una imagen
#include <iostream>
#include <opencv2/opencv.hpp>
#include <ctime>
#include <fstream>
#include <sys/time.h>
#include <unistd.h>

using namespace cv;
using namespace std;

// Estructura para argumentos hilos
typedef struct
{
    int idHilo;
    int col;
    int row;
    int numHilo;
    Mat *imagen;
} argumentosHilo;

//Prototipos de funciones
Mat lectura_imagen(String nombre_imagen);
void *aplicar_filtro(void *arg);
void filtro_amarillo(String nombre, int hilos);
ofstream archivo;

int main(int argc, char **argv)
{
    filtro_amarillo(argv[1], atoi(argv[2]));
    waitKey(0);
    return 0;
}

//**** Funcion hilos ******
void *aplicar_filtro(void *arg)
{
    // argumentos hilo
    argumentosHilo info = *(argumentosHilo *)arg;

    // Datos necesarios para balanceo de carga Blockwise
    int inicio, fin, espacio, idHilo = info.idHilo, row = info.row, col = info.col, numHilos = info.numHilo;
    espacio = col / numHilos;
    inicio = idHilo * espacio;

    if (idHilo == numHilos - 1)
    {
        fin = col;
    }
    else
    {
        fin = inicio + espacio;
    }

    // Aplicacion del filtro sobre la imagen
    for (int y = 0; y < row; y++)
    {
        for (int x = inicio; x < fin; x++)
        {
            Vec3b color = (*(info.imagen)).at<Vec3b>(y, x);
            int azul = (int)color.val[0];
            int verde = (int)color.val[1];
            int rojo = (int)color.val[2];
            int promedio = (int)((azul + verde + rojo) / 3);

            if (rojo > 200 && verde > 100 && azul < 85)
            {
                color.val[0] = azul;
                color.val[1] = verde;
                color.val[2] = rojo;
            }
            else
            {
                color.val[0] = 255;
                color.val[1] = 255;
                color.val[2] = 255;
            }
            (*(info.imagen)).at<Vec3b>(y, x) = color;
        }
    }
    return 0;
}

//***filtro2*****
void filtro_amarillo(String nombre, int hilos)
{
    int pixel = 0;
    short veces = 0;
    Mat imagen = lectura_imagen(nombre);
    int idHilo[hilos], i, *retval;
    pthread_t thread[hilos];
    argumentosHilo *argumentos = (argumentosHilo *)malloc(sizeof(argumentosHilo) * hilos);

    // Creacion de hilos
    for (i = 0; i < hilos; i++)
    {
        idHilo[i] = i;
        (*(argumentos + i)).imagen = &imagen;
        (*(argumentos + i)).col = imagen.cols;
        (*(argumentos + i)).numHilo = hilos;
        (*(argumentos + i)).row = imagen.rows;
        (*(argumentos + i)).idHilo = i;

        int k = pthread_create(&thread[i], NULL, &aplicar_filtro, (argumentos + i));
    }

    for (i = 0; i < hilos; i++)
    {
        pthread_join(thread[i], (void **)&retval);
    }
    if (hilos == 16)
    {
        imwrite("filtradacolor" + nombre, imagen);
    }
}
/*****Procedimiento que lee la imagen******/
Mat lectura_imagen(String nombre_imagen)
{
    // Lectura de la imagen
    Mat imagen = imread(nombre_imagen, 1);

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