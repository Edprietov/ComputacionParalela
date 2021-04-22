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
    int num_filtro;
    Mat *imagen;
} argumentosHilo;



//Prototipos de funciones
Mat lectura_imagen(String nombre_imagen);
void *aplicar_filtro(void *arg);
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

//**** Funcion hilos ******
void *aplicar_filtro(void *arg)
{
    // argumentos hilo
    argumentosHilo info = *(argumentosHilo *)arg;

    // Datos necesarios para balanceo de carga Blockwise
    int inicio, fin, espacio, idHilo = info.idHilo, row = info.row, col = info.col, numHilos = info.numHilo, numfiltro = info.num_filtro;
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
            (*(info.imagen)).at<Vec3b>(y, x) = color;
        }
    }
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
        (*(argumentos + i)).num_filtro = numfiltro;

        int k = pthread_create(&thread[i], NULL, &aplicar_filtro, (argumentos + i));
    }

    for (i = 0; i < hilos; i++)
    {
        pthread_join(thread[i], (void **)&retval);
    }
    if (hilos == 16)
    {   
        String nombre_archivo = "filtradacolor_filtro" + to_string(numfiltro) + "nombre " + nombre;
        imwrite(nombre_archivo, imagen);
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
