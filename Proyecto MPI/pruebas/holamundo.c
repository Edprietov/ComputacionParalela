#include <mpi.h>
#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
  int proceso;
  int total;
  int value;
  MPI_Status status;
  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD, &total);
  MPI_Comm_rank(MPI_COMM_WORLD, &proceso);

  if (total == 1)
  {
    printf("Estoy hablando desde: %d de: %d\n", proceso, total - 1);
  }
  else
  {
    if (proceso == 0)
    {
      value = -5;
      for (int i = 1; i < total; i++)
      {
        MPI_Send(&value, 1, MPI_INT, i, 0, MPI_COMM_WORLD);
      }
      printf("Estoy hablando desde: %d de: %d\n", proceso, total - 1);
    }
    else
    {
      MPI_Recv(&value, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
      long aux = 0;
      for (int i = 0; i < 300000000; i++)
      {
        //printf("%ld\n",aux);
        aux = aux +1;
      }
       
      printf("Estoy hablando desde: %d de: %d\n", proceso, total - 1);
    }
  }

  MPI_Finalize();
  return 0;
}