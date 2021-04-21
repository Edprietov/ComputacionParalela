echo Realizando ejecuciones
for k in landscape.jpg sunflower.jpg minions-3.jpg
do
cmake .
make 
echo "Imagen" $k
echo "Imagen" $k >> resultados.txt
for j in $(seq 0 15)
do
d1=$(date "+%s%N")/1000000
TIMEFORMAT=%R
time ./EfectoImagen $k
d2=$(date "+%s%N")/1000000
echo $(($d2 - $d1)) >> resultados.txt
done
done
rm Makefile
rm cmake_install.cmake
rm EfectoImagen
rm CMakeCache.txt
