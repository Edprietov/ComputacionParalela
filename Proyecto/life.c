// gcc life.c -o life -lgraph
// ./life
#include<stdio.h>
#include<stdlib.h>
#include<graphics.h>
#include <time.h>
#include <stdlib.h>


#define n 400
#define vida 79
//#define muerte 120
//#define muerte '*'
#define muerte ' '

char matriz[n][n];
time_t t;
int iteracion = 0;

void imprimirMatriz();
int calcularVecino(int i, int j);
void inicializar();
void iterar();

int main() {
    int gdriver=DETECT, gmode;
    initgraph(&gdriver,&gmode,"C:\\BORLANDC\\BGI");
    srand((unsigned) time(&t));
    int maxx=getmaxx();
    int maxy=getmaxy();
    printf("%d, %d",maxx,maxy);
    inicializar();
    imprimirMatriz();
    sleep(10);
    while(1){
	cleardevice();
	imprimirMatriz();
	iterar();
    }

}


void imprimirMatriz(){
    iteracion++;
    char texto[100];
    strcat(texto, "Iteracion: ");
    sprintf(texto, "%d", iteracion);
    outtextxy(450, 200, texto);
    for (int i = 0; i < n; i++){
        for (int j = 0; j < n; j++){
	    if(matriz[i][j] == vida){
	    	circle(j+2,i+2,0.5);
	    }
        }
    }
}


int calcularVecino(int i, int j){
    int aux = 0;
    for (int k = i-1; k < i+2; k++){
        for (int l = j-1; l < j+2; l++){
            if (!(k == i && j == l)){
                if (matriz[k][l] == vida){
                    aux += 1;
                }
            }
        }   
    }
    return aux;
}

void inicializar(){
    for (int i = 0; i < n; i++){
        for (int j = 0; j < n; j++){
            //if(i == 0 || i == n-1 || j == 0 || j == n-1){
            matriz[i][j] = muerte;
        }   
    }
/*
    for (int k = 0; k < n*(n/4); k++){
	int i = rand() % n;
	int j = rand() % n;
	if(!(i == 0 || i == n-1 || j == 0 || j == n-1)){
	    matriz[i][j] = vida;	
	}
	
    }
*/
    matriz[200+0][200+0] = vida;
    matriz[200+1][200+0] = vida;
    matriz[200+4][200+0] = vida;

    matriz[200+0][200+1] = vida;
    matriz[200+3][200+1] = vida;

    matriz[200+0][200+2] = vida;
    matriz[200+3][200+2] = vida;
    matriz[200+4][200+2] = vida;

    matriz[200+2][200+3] = vida;

    matriz[200+0][200+4] = vida;
    matriz[200+2][200+4] = vida;
    matriz[200+3][200+4] = vida;
    matriz[200+4][200+4] = vida;
/*
    matriz[5][1] = vida;
    matriz[5][2] = vida;
    matriz[6][1] = vida;
    matriz[6][2] = vida;
    
    matriz[3][35] = vida;
    matriz[3][36] = vida;
    matriz[4][35] = vida;
    matriz[4][36] = vida;
    
    matriz[5][11] = vida;
    matriz[6][11] = vida;
    matriz[7][11] = vida;
    matriz[4][12] = vida;
    matriz[3][13] = vida;
    matriz[3][14] = vida;
    matriz[8][12] = vida;
    matriz[9][13] = vida;
    matriz[9][14] = vida;
    matriz[6][15] = vida;
    
    
    matriz[4][16] = vida;
    matriz[8][16] = vida;
    matriz[5][17] = vida;
    matriz[6][17] = vida;
    matriz[6][18] = vida;
    matriz[7][17] = vida;
    
    matriz[3][21] = vida;
    matriz[4][21] = vida;
    matriz[5][21] = vida;
    matriz[3][22] = vida;
    matriz[4][22] = vida;
    matriz[5][22] = vida;
    matriz[2][23] = vida;
    matriz[6][23] = vida;
    
    matriz[1][25] = vida;
    matriz[2][25] = vida;
    
    matriz[6][25] = vida;
    matriz[7][25] = vida;
*/
}

void iterar(){
    int auxMatriz[n][n];
    for (int i = 1; i < n-1; i++){
        for (int j = 1; j < n-1; j++){
            auxMatriz[i][j] = calcularVecino(i,j);
        }
    }
    
    for (int i = 1; i < n-1; i++){
        for (int j = 1; j < n-1; j++){
            if (matriz[i][j] == muerte && auxMatriz[i][j] == 3){
                matriz[i][j] = vida;
            }else if (matriz[i][j] == vida && (auxMatriz[i][j] > 3 || auxMatriz[i][j] < 2)){
                matriz[i][j] = muerte;
            }
        }
    }
}

