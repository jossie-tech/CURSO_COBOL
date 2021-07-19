      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:21/01/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 NUMERO PIC 999.

       PROCEDURE DIVISION.

      * INICIO.
      *TIMES ejecuta la rutina el numero indicado de veces
      *     PERFORM OPERACION 100 TIMES.
      *UNTIL ejecuta la rutina hasta que la variable valga el valor indicado 100
      *     PERFORM OPERACION UNTIL NUMERO = 100;
      * OPERACION.
      *     ADD 1 TO NUMERO.
      *     DISPLAY NUMERO.

      *VARYING aumenta el NUMERO de uno en uno hasta que valga el valor indicado 100
      *Las siguientes cuatro lineas son ejemplo de VARYING

      * CONDICION.
      *     PERFORM INICIO VARYING NUMERO FROM 1 BY 1 UNTIL NUMERO = 100.
      *     STOP RUN.
      * INICIO.
      *     DISPLAY NUMERO.
      *Las siguientes lineas son una variacion de VARYING
      *EN FROM 1 estamo indicando que la variable NUMERO inicie en 1 y aumente 1
       INICIO.
           PERFORM VARYING NUMERO FROM 2 BY 6 UNTIL NUMERO >100
           DISPLAY NUMERO
           END-PERFORM
           STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
