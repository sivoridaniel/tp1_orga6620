#define MAXIMO 4096
#define MINIMO 2

#define CAMPO_VACIO 0
#define PRIMERA_POSICION 0
#define SEGUNDA_POSICION 1
#define TERCERA_POSICION 2
#define INICIO_ARRAY 0

#define TODO_OK 0
#define ERROR_FUERA_DE_RANGO 1
#define ERROR_COMANDO_INVALIDO 2
#define ERROR_CREACION_DE_ARCHIVO 3

#define CORRECTO 0
#define OPCION 1
#define OPCION_OUTPUT_FILE 2
#define OPCION_GUION 3

#define DOS_ARGUMENTOS 2
#define TRES_ARGUMENTOS 3
#define CINCO_ARGUMENTOS 5
#define TODOS_LOS_ARGUMENTOS 6

#define UNA_POSICION 1

#define ALGUN_PROBLEMA 0

//Pre: Se ingresa el arreglo y su cantidad maxima de elementos.
//Pos: Los valores distintos a cero en el arreglo seran los numeros primos buscados. 
void encontrarNumerosPrimos(int tope, int arreglo[]);


//Pre: Se ingresa el arreglo.
//Pos: Se imprimen por pantalla el o los resultados.
void imprimirPorPantalla(int resultado[]);

//Pre: Se ingresa el arreglo.
//Pos: Se crea un archivo de texto en el cual se guardaran los resultados.
int generarArchivo(int arreglo[]);

//Imprime por pantalla las instrucciones de uso
void mostrarAyuda();

//Imprime por pantalla la version
void mostrarVersion();

//Verifica que los argumentos sean -h, -V, -o N, - N; donde N es un entero mayor que 2 y menor que el maximo (4096).
//Verifica que los argumentos sean -h, -V, -o N, - N; 
//donde N es un entero mayor que 2 y menor que el maximo (yo puse 4096).
//Devuelve: 1 si el entero se escapa del rango predeterminado.
//			2 si no se ingresaron comando validos.
//			0 si todos los argumentos son validos y se puede proceder.
int validarArgumentos(int argc, char **argv);

//Realizara alguna de las acciones:
//	-h muestra el menu de ayuda.
//	-V muestra la version.
//	-o muestra por pantalla y crea un archivo.
//	-  muestra por pantalla.
int realizarAccion(int argc, char **argv);
