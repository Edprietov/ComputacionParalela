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

int main(int argc, char **argv)
{
    filtro_escala_grises(argv[1]);

    waitKey(0);
    return 0;
}

//***filtro1*****
void filtro_escala_grises(String nombre)
{
    int pixel = 0;
    short veces = 0;
    unsigned tiempo_final, tiempo_inicial;
    ofstream archivo;
    archivo.open("resultados.txt");
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

                color.val[0] = promedio;
                color.val[1] = promedio;
                color.val[2] = promedio;

                imagen.at<Vec3b>(y, x) = color;
            }
        }
        tiempo_final = clock();

        double tiempo_total = double(tiempo_final - tiempo_inicial);
        if (veces == 1)
        {
            archivo << "Tiempo de ejecucion: "
                    << "\n";
        }
        else
        {
            archivo << tiempo_total << "\n";
        }
    }
    imwrite("filtrada" + nombre, imagen);
    archivo.close();
}
//*****Procedimiento que lee la imagen******
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