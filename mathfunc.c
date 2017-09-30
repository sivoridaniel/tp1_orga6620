#include "mathfunc.h"

//Halla el máximo común divisor entre los valores pasados por parámetro.
int mcd(int numeroBajo, int numeroAlto){
	int auxiliar;
    while (numeroBajo > 0){
        auxiliar = numeroBajo;
        numeroBajo = numeroAlto % numeroBajo;
        numeroAlto = auxiliar;
    }
    return numeroAlto;
}

//Halla el mínimo común múltiplo entre los valores pasados por parámetro.
int mcm(int numeroBajo, int numeroAlto){
    int numerador = numeroBajo * numeroAlto;
    int mcdDenominador = mcd(numeroBajo,numeroAlto);
    int resultadoMcm = numerador / mcdDenominador;
    return resultadoMcm;
}
