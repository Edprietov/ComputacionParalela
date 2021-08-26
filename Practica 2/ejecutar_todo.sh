echo Ejecutando todo
mkdir Resultados
for imagen in sunflower.jpg imagen720.jpg imagen1080.jpg
do
cmake .
make 
echo "Imagen" $imagen
echo "Imagen" $imagen >> resultados.txt
for h in 1 2 4 8 16
do
for filtro in 1 
do
echo $h hilos $filtro filtro
echo $h hilos $filtro filtro >> resultados.txt 
for j in $(seq 0 15)
do
d1=$(date "+%s%N")/1000000
TIMEFORMAT=%R
time ./EfectoImagen $imagen $filtro $h
d2=$(date "+%s%N")/1000000
echo $(($d2 - $d1)) >> resultados.txt
done
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
