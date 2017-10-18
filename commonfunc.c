#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "commonfunc.h"
#include "mathfunc.h"

void imprimirPorPantalla(int resultado[]){
	printf("%d\n", resultado[PRIMERA_POSICION]);
	if (resultado[SEGUNDA_POSICION] != CAMPO_VACIO) {
		printf("%d\n", resultado[SEGUNDA_POSICION]);
	}
}

int generarArchivo(int arreglo[]){
	FILE *archivo;
	archivo = fopen ("out.txt", "w");
	if(archivo != ALGUN_PROBLEMA){
		int i;
		for (i = INICIO_ARRAY; i <= 1; i++){
			if (arreglo[i] != CAMPO_VACIO){
				fprintf ( archivo, "%d\n", arreglo[i]);
			}
		}
		fclose(archivo);
	   return TODO_OK;
	}else{
	   return ERROR_CREACION_DE_ARCHIVO;
	}
	return TODO_OK;
}

void mostrarVersion(){
	printf("Common version 1.0 \n");	
}

void mostrarAyuda(){
	printf("Usage: \n");
	printf("	common -h\n");
	printf("	common -V\n");
	printf("	common [options] M N\n");
	printf("Options:\n");
	printf("	-h,		--help		Prints usage information.\n");
	printf("	-V,		--version	Prints version information.\n");
	printf("	-o,		--output	Path to output file.\n");
	printf("	-d 		--divisor	Just the divisor\n");
	printf("	-m 		--multiple 	Just the multiple\n");
	printf("Examples:\n");
	printf("	common -o - 256 192\n");
}

//Se verifica que los parámetros ingresados sigan el formato predeterminado
int validarArgumentos(int argc, char **argv){
	if ((argc > TODOS_LOS_ARGUMENTOS) || (argc < DOS_ARGUMENTOS)){
		return ERROR_COMANDO_INVALIDO;
	}
	
	if (argc != TRES_ARGUMENTOS){
		if (strcmp(argv[OPCION], "-h") != CORRECTO){
			if (strcmp(argv[OPCION], "-V") != CORRECTO){
				if (argc > TRES_ARGUMENTOS){
					if (((strcmp(argv[OPCION], "-d") != CORRECTO) &&
						 (strcmp(argv[OPCION], "-m") != CORRECTO) &&
						 (strcmp(argv[OPCION], "-o") != CORRECTO)) ||
						 ((strcmp(argv[OPCION_OUTPUT_FILE], "-o") != CORRECTO))){
						return ERROR_COMANDO_INVALIDO;
					}
					else {
						if ((atoi(argv[argc-1]) > MAXIMO) ||
						    (atoi(argv[argc-1]) < MINIMO)) {
							return ERROR_FUERA_DE_RANGO;
						}
		
						if ((atoi(argv[argc-2]) > MAXIMO) ||
						    (atoi(argv[argc-2]) < MINIMO)) {
							return ERROR_FUERA_DE_RANGO;
						}
					}
				}
			}
			else {
				if (argc > DOS_ARGUMENTOS) {
					return ERROR_COMANDO_INVALIDO;
				}
			}
		}
		else {
			if (argc > DOS_ARGUMENTOS) {
				return ERROR_COMANDO_INVALIDO;
			}
		}
	}
	else{
		if ((atoi(argv[argc-1]) > MAXIMO) || (atoi(argv[argc-1]) < MINIMO)){
				return ERROR_FUERA_DE_RANGO;
		}
		
		if ((atoi(argv[argc-2]) > MAXIMO) || (atoi(argv[argc-2]) < MINIMO)){
				return ERROR_FUERA_DE_RANGO;
		}
	}
	return TODO_OK;		
}		


//Se realiza la accion previamente validada, ya sea mostrar la version, la ayuda, mcm o mcd.
int realizarAccion(int argc, char **argv){
	
	int mensajeDeError = TODO_OK;
	int resultado[DOS_ARGUMENTOS];
	resultado[PRIMERA_POSICION] = CAMPO_VACIO;
	resultado[SEGUNDA_POSICION] = CAMPO_VACIO;
	
	if (strcmp(argv[OPCION], "-h") == CORRECTO){ 
		mostrarAyuda();
	} 
	else{
		if (strcmp(argv[OPCION], "-V") == CORRECTO){
			mostrarVersion();
		}
		else{
			int numeroBajo = atoi(argv[argc-2]);
			int numeroAlto = atoi(argv[argc-1]);
			if (strcmp(argv[OPCION], "-d") == CORRECTO){
				resultado[PRIMERA_POSICION] = mcd(numeroBajo, numeroAlto);
			}
			else{
				if (strcmp(argv[OPCION], "-m") == CORRECTO){
					resultado[PRIMERA_POSICION] = mcm(numeroBajo, numeroAlto);
				}
				else {
					
					resultado[PRIMERA_POSICION] = mcd(numeroBajo, numeroAlto);
					resultado[SEGUNDA_POSICION] = mcm(numeroBajo, numeroAlto);
				}
			}
			mensajeDeError = generarArchivo(resultado);
			if (((argc > TRES_ARGUMENTOS) && (strcmp(argv[OPCION_GUION], "-") == CORRECTO)) ||
				 (argc == TRES_ARGUMENTOS)){
				imprimirPorPantalla(resultado);
			}
		}
	}	
	return mensajeDeError;
} 		
