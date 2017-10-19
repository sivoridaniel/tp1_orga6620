#include <stdio.h>
#include "commonfunc.h"

int main(int argc, char **argv){
	int alerta = validarArgumentos(argc, argv);
	if (alerta == TODO_OK){
		alerta = realizarAccion(argc, argv);
	}	
	return alerta;
}
