#mpicc -o hola holamundo.c
echo Ejecutando todo
mkdir Resultados
for imagen in Inicial400x400.png
do
cmake .
make 
echo "Imagen" $imagen
echo "Imagen" $imagen >> resultados.txt
for h in 1 2 4 6 8 16
do
echo $h hilos 
echo $h hilos >> resultados.txt 
d1=$(date "+%s%N")/1000000
TIMEFORMAT=%R
for j in $(seq 0 31)
do
mpirun -oversubscribe -np $h EfectoImagen $imagen
done
d2=$(date "+%s%N")/1000000
echo $(($d2 - $d1))
echo $(($d2 - $d1)) >> resultados.txt
done
done
mv resultados.txt Resultados
rm Makefile
rm cmake_install.cmake
rm EfectoImagen
rm CMakeCache.txt
rm -r CMakeFiles
rm -r -I Resultados