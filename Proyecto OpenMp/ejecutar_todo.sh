echo Ejecutando todo
cmake .
make 
mkdir Resultado
for imagen in Inicialimagen1080.jpg
do
for h in 1 
do
echo $h hilos
echo $h hilos >> resultados.txt
for j in $(seq 0 0)
do
d1=$(date "+%s%N")/1000000
TIMEFORMAT=%R
time ./life $imagen $h
d2=$(date "+%s%N")/1000000
echo $(($d2 - $d1)) >> resultados.txt
done
done
done
mv resultados.txt Resultado
rm -r -I Resultado
rm -i Inicial$imagen Final$imagen
rm Makefile
rm cmake_install.cmake
rm life
rm CMakeCache.txt
rm -r CMakeFiles
