      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:21/01/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULADORA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      *Declaración de variables
       01 NUMERO PIC 99.
       01 MULTIPLICADOR PIC 999.
       01 RESULTADO PIC 99999.
       01 SALIDA PIC X(5).


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           INICIO.
           DISPLAY "Para salir introduce 'salir' en la consola.".
           DISPLAY "Para multiplicar pulsa intro.".
           ACCEPT SALIDA.
           IF SALIDA = "salir"
               GO TO FINALIZAR
           ELSE
           PERFORM REINICIA-PROGRAMA.
           PERFORM INTRODUCE-NUMERO.
           PERFORM MOSTRAR-TABLA.

           FINALIZAR.
               STOP RUN.

           REINICIA-PROGRAMA.
               MOVE 0 TO MULTIPLICADOR.

           INTRODUCE-NUMERO.
               DISPLAY "Introduce un numero.".
               ACCEPT NUMERO.

           MOSTRAR-TABLA.
               DISPLAY "La tabla del " NUMERO ":".
      *Con la palabra reservada TIMES se ejecuta la rutina CALCULOS 10 veces
               PERFORM CALCULOS 10 TIMES.

           CALCULOS.
               ADD 1 TO MULTIPLICADOR.
      *COMPUTE puede realizar diferenes operaciones
               COMPUTE RESULTADO = NUMERO * MULTIPLICADOR.
               DISPLAY NUMERO "*" MULTIPLICADOR "=" RESULTADO.

       END PROGRAM CALCULADORA.
s