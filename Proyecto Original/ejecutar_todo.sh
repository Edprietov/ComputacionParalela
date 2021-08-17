echo Ejecutando todo
for imagen in 400x400.png
do
cmake .
make 
./life $imagen
rm -i Inicial$imagen Final$imagen
done
rm Makefile
rm cmake_install.cmake
rm life
rm CMakeCache.txt
rm -r CMakeFiles
