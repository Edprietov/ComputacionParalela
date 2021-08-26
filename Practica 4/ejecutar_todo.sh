#mpicc -o hola holamundo.c
echo Ejecutando todo
mkdir Resultados
for imagen in sunflower.jpg imagen720.jpg imagen1080.jpg
do
cmake .
make 
echo "Imagen" $imagen
echo "Imagen" $imagen >> resultados.txt
for h in 1 2 4 6 8 16
do
echo $h hilos 
echo $h hilos >> resultados.txt 
for j in $(seq 0 15)
do
d1=$(date "+%s%N")/1000000
TIMEFORMAT=%R
time mpirun -oversubscribe -np $h EfectoImagen $imagen
d2=$(date "+%s%N")/1000000
echo $(($d2 - $d1)) >> resultados.txt
done
done
done
mv resultados.txt Resultados
rm Makefile
rm cmake_install.cmake
rm EfectoImagen
rm CMakeCache.txt
rm -r CMakeFiles
rm -r -I Resultados