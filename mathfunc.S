#include <mips/regdef.h>

#########FUNCION HOJA MCD###########

#STATICS VAR DEFINITIONS FUNCTION MCD
#define SF_SIZE_MCD	  16 
#define SF_MCD_FP_POS     12
#define SF_MCD_GP_POS      8 

.text
.abicalls
.align 2
.globl mcd 
.ent mcd


mcd:
	###INCIALIZACION DEL STACK FRAME DE LA FUNCION MCD###
	.frame		$fp, SF_SIZE_MCD, ra
	.set		noreorder
	.cpload		t9
	.set		reorder
	subu		sp, sp, SF_SIZE_MCD
	sw		$fp, SF_MCD_FP_POS(sp) 
		.cprestore	SF_MCD_GP_POS
	move		$fp, sp
	###FIN INICIALIZACION DEL STACK FRAME DE LA FUNCION MCD###
	#guardo los argumentos en la aba de la func que me llamo
	sw		a0, 16($fp)		
	sw		a1, 20($fp)       	
	#Si a0 > 0, ingresa al loop
	bgtz		a0, iterando_mcd		
	#Asigno en v0 el valor del parametro numeroAlto	
	move		v0, a1
	#Si a0 <=0, salta a fin				
	j		fin_mcd			

iterando_mcd:
	#guardo en la posicion 0 del stack frame el valor auxiliar
	sw		a0, 0($fp)
	#Calculo el resto de la division numeroAlto/numeroBajo		
	div		a1, a0
	#Guardo el valor del modulo en numeroBajo			
	mfhi		t0	
	#Obtengo el valor auxiliar, guardado en la posicion 0 del stack		
	lw		t1, 0($fp)
	#El resto de la division lo guardo en a0		
	move		a0, t0
	#Ahora el numeroAlto es el valor auxiliar                 
	move		a1, t1
	#Si a0 es mayor a 0, sigue en el loop. Caso contrario va a  fin_mcd			
	bgtz		a0, iterando_mcd	

fin_mcd:
	#El numero alto es lo que retorna la funcion
	move		v0, a1		        
	###RESTAURO LOS REGISTROS###
	move		sp,  $fp
	lw		gp,  SF_MCD_GP_POS(sp)
	lw		$fp, SF_MCD_FP_POS(sp)
	###DESTRUYO EL STACK FRAME###
	addu		sp, sp, SF_SIZE_MCD
	###RETORNO A LA SIGUIENTE INSTRUCCION DE LA FUNC QUE LLAMO A CMD###
	jr		ra
	.end          	mcd

#########FIN FUNCION HOJA MCD###########

#########FUNCION NO HOJA MCM############

#STATICS VAR DEFINITIONS FUNCTION MCM
#define SF_MCM_A1_POS	  44 
#define SF_MCM_A0_POS	  40 
#define SF_SIZE_MCM	  40 
#define SF_MCM_FP_POS     32
#define SF_MCM_GP_POS     28 
#define SF_MCM_RA_POS     24 

.text
.abicalls
.align 2
.globl mcm 
.ent mcm

mcm:
	###INCIALIZACION DEL STACK FRAME DE LA FUNCION MCM###
	.frame		$fp, SF_SIZE_MCM, ra
	.set		noreorder
	.cpload		t9
	.set		reorder
	subu		sp, sp, SF_SIZE_MCM
	sw		ra, SF_MCM_RA_POS(sp)
	sw		$fp, SF_MCM_FP_POS(sp) 
	.cprestore	SF_MCM_GP_POS
	move		$fp, sp
	###FIN INICIALIZACION DEL STACK FRAME DE LA FUNCION MCM###

	#guardo en la aba de la func que me llamo los argumentos
	sw		a0, SF_MCM_A0_POS($fp)		
	sw		a1, SF_MCM_A1_POS($fp)		
	
	#llamo a la funcion mcd con los parametros numeroBajo y numeroAlto
	jal 		mcd				

sigue:
	#guardo en el stack el valor de mcd, valor que retorno la funcion (es el denominador)
	sw		v0, 16($fp)
	#recupero del stack el valor de numeroBajo en el registro t0
        lw              t0, SF_MCM_A0_POS($fp) 
        #recupero del stack el valor de numeroAlto en el registro t1
	lw		t1, SF_MCM_A1_POS($fp)
	#Hago (numeroBajo)/(mcd(numeroBajo,numeroAlto))
	div		t0,v0
	#Guardo en el registro t0 el resultado de la division
        mflo		t0 
	#Hago numeroAlto* t0(resultado de la division)
	mult		t1,t0
	#Guardo el resultado de la operacion anterior en el registro t2
	mflo		t2	

	#Guardo en V0 el resultado de mcm
	move		v0,t2	
        
	#Guardo en el stack el resultado de mcm			
	sw		t2,20($fp)			
	
	###FIN MCM###
	###RESTAURO LOS REGISTROS###
	move		sp, $fp
	lw		ra, SF_MCM_RA_POS(sp)
	lw		gp, SF_MCM_GP_POS(sp)
	lw		$fp, SF_MCM_FP_POS(sp)
	###DESTRUYO EL STACK FRAME###
	addu		sp, sp, SF_SIZE_MCM
	###RETORNO A LA SIGUIENTE INSTRUCCION DE LA FUNC QUE LLAMO A CMD###
	jr		ra
	.end          	mcm
