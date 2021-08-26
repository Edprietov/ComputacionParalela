// Programa que implementa el algoritmo de aplicación de algunos filtros sobre una imagen
#include <iostream>
#include <opencv2/opencv.hpp>
#include <ctime>
#include <fstream>
#include <sys/time.h>
#include <unistd.h>
#include <omp.h>

using namespace cv;
using namespace std;

/* Prototipos de funciones */
void *inicializar(String nombre, int hilos);
int calcularVecino(Mat imagen, int i, int j);
Mat lectura_imagen(String nombre_imagen);
Mat iterar(Mat imagen, int hilos);
ofstream archivo;

/* definicion global del filtro a utilizar */
#define vida 0
#define muerte 255


int main(int argc, char **argv)
{
    /* orden argumentos nombre, numero filtro, numero hilos */
    inicializar(argv[1], atoi(argv[2]));
    //printf("HILOS # %i\n", atoi(argv[2]));
    return 0;
    
}

void *inicializar(String nombre, int hilo)
{
    Mat imagen = lectura_imagen(nombre);

    for (int i = 0; i < imagen.rows; i++){
        for (int j = 0; j < imagen.cols; j++){
            Vec3b color = imagen.at<Vec3b>(i, j);
            color.val[0] = muerte;
            color.val[1] = muerte;
            color.val[2] = muerte;
            imagen.at<Vec3b>(i, j) = color;
        }
    }
    /* PRUEBA INICIAL CON UN PATRON DEFINIDO*/
    Vec3b color = imagen.at<Vec3b>(200+0, 200+0);
    color.val[0] = vida;
    color.val[1] = vida;
    color.val[2] = vida;
    imagen.at<Vec3b>(200+0, 200+0) = color;
    imagen.at<Vec3b>(200+1, 200+0) = color;
    imagen.at<Vec3b>(200+4, 200+0) = color;

    imagen.at<Vec3b>(200+0, 200+1) = color;
    imagen.at<Vec3b>(200+3, 200+1) = color;

    imagen.at<Vec3b>(200+0, 200+2) = color;
    imagen.at<Vec3b>(200+3, 200+2) = color;
    imagen.at<Vec3b>(200+4, 200+2) = color;

    imagen.at<Vec3b>(200+2, 200+3) = color;

    imagen.at<Vec3b>(200+0, 200+4) = color;
    imagen.at<Vec3b>(200+2, 200+4) = color;
    imagen.at<Vec3b>(200+3, 200+4) = color;
    imagen.at<Vec3b>(200+4, 200+4) = color;

    imwrite("Inicial" + nombre, imagen);
    for (int k = 0; k < 200; k++){
        imagen = iterar(imagen, hilo );
        imwrite("Final" + nombre, imagen);
    }
    
    return 0;
}

int calcularVecino(Mat imagen, int i, int j){
    int aux = 0;
            
    for (int k = i-1; k < i+2; k++){
        for (int l = j-1; l < j+2; l++){
            if (!(k == i && j == l)){
                Vec3b color = (imagen).at<Vec3b>(k, l);
                int azul = (int)color.val[0];
                if (azul == vida){
                    aux += 1;
                }
            }
        }   
    }
    return aux;
}

Mat iterar(Mat imagen, int hilos){
    int auxMatriz[imagen.rows][imagen.cols];

    for (int i = 1; i < imagen.rows-1; i++){
        for (int j = 1; j < imagen.cols-1; j++){
            auxMatriz[i][j] = calcularVecino(imagen, i,j);
        }
    }
/*
    for (int i = 0; i < 10; i++){
        for (int j = 0; j < 10; j++){
            cout << auxMatriz[i][j] << " ";
        }
        cout << endl;
    }
*/

    int cols = imagen.cols - 1;
    int rows = imagen.rows - 1;
    int espacio = cols / hilos;
    omp_set_num_threads(hilos);
    #pragma omp parallel 
    {
        int id = omp_get_thread_num();

        //printf("id: %i \n", id);
        int nthreads = hilos;
        int inicio =  (id == 0) ? 1 : id * espacio;
        int fin = (id == hilos - 1) ? cols : inicio + espacio;
        (id == 0) ? fin = espacio: fin = fin;

        for (int i = 1; i < rows ; i++){
            for (int j = inicio ; j < fin; j++){
                Vec3b color = * ( &(imagen.at<Vec3b>(i, j)));
                int azul = (int)color.val[0];
                int valor = * (& (auxMatriz[i][j]));
                if (azul == muerte && valor == 3){
                    color.val[0] = vida;
                    color.val[1] = vida;
                    color.val[2] = vida;
                }else if (azul == vida && (valor > 3 || valor < 2)){
                    color.val[0] = muerte;
                    color.val[1] = muerte;
                    color.val[2] = muerte;
                }
                * ( &(imagen.at<Vec3b>(i, j))) = color;
            }
        }
    }
        

    return imagen;
}

/**** Procedimiento que lee la imagen ****/
Mat lectura_imagen(String nombre_imagen)
{
    /* Lectura de la imagen */
    Mat imagen = imread(nombre_imagen, 1);

    /* Manejo de error en caso de que no sea encontrada la imagen */
    if (imagen.empty())
    {
        cout << "Archivo de imagen "
             << "No encontrado" << endl;
        cin.get();
        return imagen;
    }
    return imagen;
}
