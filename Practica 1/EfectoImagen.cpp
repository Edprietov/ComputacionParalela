// Programa que implementa el algoritmo de aplicación de algunos filtros sobre una imagen
#include <iostream>
#include <opencv2/opencv.hpp>
#include <ctime>
#include <fstream>

using namespace cv;
using namespace std;


//Prototipos de funciones
Mat lectura_imagen(String nombre_imagen);
void filtro_escala_grises(String nombre);
void filtro_amarillo(String nombre);
ofstream archivo;


int main(int argc, char **argv)
{
    archivo.open("resultados.txt");
    filtro_amarillo(argv[1]);
    archivo.close();
    waitKey(0);
    return 0;
}

//***filtro2*****
void filtro_amarillo(String nombre)
{
    int pixel = 0;
    short veces = 0;
    unsigned tiempo_final, tiempo_inicial;
    Mat imagen ;

    while (veces++ < 16)
    {
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

                if( rojo > 200 && verde > 100 && azul < 85  ){
                color.val[0] = azul;
                color.val[1] = verde;
                color.val[2] = rojo;
                }
                else{
                color.val[0] = 255;
                color.val[1] = 255;
                color.val[2] = 255;
                }
                
                imagen.at<Vec3b>(y, x) = color;
            }
        }
        tiempo_final = clock();

        double tiempo_total = (double(tiempo_final - tiempo_inicial)/CLOCKS_PER_SEC);
        if (veces == 1)
        {
            archivo << "Tiempo de ejecucion para aplicación sobre " <<  nombre 
                    << "\n";
        }
        else
        {
            archivo << tiempo_total <<  " segundos " << "\n";
        }
    }
    imwrite("filtradacolor" + nombre, imagen);
}
