echo Ejecutando todo
mkdir Resultados
#for imagen in Inicial400x400.png Inicialimagen1080.jpg
for imagen in Inicial400x400.png 
do
cmake .
make 
echo "Imagen" $imagen
echo "Imagen" $imagen >> resultados.txt
for j in $(seq 0 4)
do
d1=$(date "+%s%N")/1000000
TIMEFORMAT=%R
time ./life $imagen
d2=$(date "+%s%N")/1000000
echo $(($d2 - $d1)) >> resultados.txt
done
done
mv resultados.txt Resultados
rm Makefile
rm cmake_install.cmake
rm life
rm CMakeCache.txt
rm -r CMakeFiles
rm -i Inicial$imagen Final$imagen
rm -r -I Resultados