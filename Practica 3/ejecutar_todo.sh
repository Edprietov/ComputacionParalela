echo Ejecutando todo
mkdir Resultados
#for imagen in landscape.jpg sunflower.jpg flowers1k.jpg landscape720.jpg
for imagen in flowers1k.jpg
do
cmake .
make 
echo "Imagen" $imagen
echo "Imagen" $imagen >> resultados.txt
for h in 64 128 256 512 1024
do
for filtro in 1 2 3
do
echo $h hilos $filtro filtro
echo $h hilos $filtro filtro >> resultados.txt 
for j in $(seq 0 15)
do
d1=$(date "+%s%N")/1000000
TIMEFORMAT=%R
time ./EfectoImagen $imagen $h $filtro $j
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
#rm -r -I Resultados
