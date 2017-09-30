#!/bin/bash
echo ""
echo "==========================COMIENZO PRUEBAS==============================="
echo ""
echo "=============================TEST 1======================================"
echo "Test 1: Mostramos el mensaje de ayuda usando la opcion -h."
../common -h
echo ""
echo "============================FIN TEST 1===================================="
echo ""
echo "============================TEST 2======================================="
echo "Test 2: Mostramos la versión del common usando la opción -V."
../common -V
echo "============================FIN TEST 2===================================="
echo ""
echo "=============================TEST 3======================================"
echo "Test 3: Mostramos por stdout el máximo común divisor entre 5 y 10."
../common -d -o - 5 10
echo ""
echo "============================FIN TEST 3===================================="
echo ""
echo "=============================TEST 4======================================"
echo "Test 4: Mostramos por stdout el minimo común múltiplo entre 5 y 10."
../common -m -o - 5 10 
echo "============================FIN TEST 4===================================="
echo ""
echo "=============================TEST 5======================================"
echo "Test 5: Mostramos por stdout el mcm y el mcd entre 5 y 10."
../common 5 10 
echo "============================FIN TEST 5===================================="
echo ""
echo "=============================TEST 6======================================"
echo  "Test 6: Mostramos por stdout el mcd entre 256 y 192."
../common -d -o - 256 192
echo "============================FIN TEST 6===================================="
echo ""
echo "=============================TEST 7======================================"
echo "Test 7: Mostramos por stdout el mcm entre 256 y 192."
../common -m -o - 256 192
echo "============================FIN TEST 7===================================="
echo ""
echo "============================TEST 8======================================="
echo "Test 8: Mostramos por stdout el mcd y el mcm entre 256 y 192."
../common 256 192
echo "============================FIN TEST 8===================================="
echo ""
echo "=============================TEST 9======================================"
echo  "Test 9: Mostramos por stdout el mcd entre 1111 y 1294."
../common -d -o - 1111 1294
echo "============================FIN TEST 9===================================="
echo ""
echo "=============================TEST 10======================================"
echo "Test 10: Mostramos por stdout el mcm entre 1111 y 1294."
../common -m -o - 1111 1294
echo "============================FIN TEST 10===================================="
echo ""
echo "============================TEST 11======================================="
echo "Test 11: Mostramos por stdout el mcd y el mcm entre 1111 y 1294."
../common 1111 1294
echo "============================FIN TEST 11===================================="
echo ""
echo "============================TEST 12======================================="
echo "Test 12: Ingresamos un comando invalido (./common -i 5 10)."
../common -i 5 10
echo "============================FIN TEST 12===================================="
echo ""
echo "============================TEST 13======================================="
echo "Test 13: Ingresamos un argumento extra en la opción -h (./common -h 10)."
../common -h 10
echo "============================FIN TEST 13===================================="
echo ""
echo "============================TEST 14======================================="
echo "Test 14: Ingresamos un comando invalido (./common aaa bbb ccc )."
../common aaa bbb ccc
echo "============================FIN TEST 14===================================="
echo ""
echo "============================TEST 15======================================="
echo "Test 15: No pasamos ningún parámetro (./common)."
../common
echo "============================FIN TEST 15===================================="
echo ""
echo "============================TEST 16======================================="
echo "Test 16: No pasamos el parámetro número en la opción -d (./common -d)."
../common -d
echo "============================FIN TEST 16===================================="
echo ""
echo "============================TEST 17======================================="
echo "Test 17: Pasamos letras en lugar del número (./common -d -o - sss)."
../common -d -o - sss
echo "============================FIN TEST 17===================================="
echo ""
echo "===========================FIN PRUEBAS==================================="
echo ""
