echo Ejecutando todo
mpicc -o hola holamundo.c
#mpiCC -o hola example.cpp
for i in 1 2 3 4
do
echo "----------------------------------"
echo "SE ESTA EJECUTANDO CON $i"
mpirun -oversubscribe -np $i hola
done