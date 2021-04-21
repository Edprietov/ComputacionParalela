echo Ejecutando todo
for imagen in minions-3.jpg landscape.jpg sunflower.jpg 
do
cmake .
make 
echo "Imagen" $imagen
echo "Imagen" $imagen >> resultados.txt
for h in 1 2 4 8 16
do
echo $h hilos
echo $h hilos >> resultados.txt
for j in $(seq 0 15)
do
d1=$(date "+%s%N")/1000000
TIMEFORMAT=%R
time ./EfectoImagen $imagen $h
d2=$(date "+%s%N")/1000000
echo $(($d2 - $d1)) >> resultados.txt
done
done
done
rm Makefile
rm cmake_install.cmake
rm EfectoImagen
rm CMakeCache.txt
