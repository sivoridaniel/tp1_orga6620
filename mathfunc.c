#include "mathfunc.h"

//Halla el maximo comun divisor entre los valores pasados por parametro.
int mcd(int numeroBajo, int numeroAlto){
	int auxiliar;
    while (numeroBajo > 0){
        auxiliar = numeroBajo;
        numeroBajo = numeroAlto % numeroBajo;
        numeroAlto = auxiliar;
    }
    return numeroAlto;
}

//Halla el minimo comun multiplo entre los valores pasados por parametro.
int mcm(int numeroBajo, int numeroAlto){
    int numerador = numeroBajo * numeroAlto;
    int mcdDenominador = mcd(numeroBajo,numeroAlto);
    int resultadoMcm = numerador / mcdDenominador;
    return resultadoMcm;
}
