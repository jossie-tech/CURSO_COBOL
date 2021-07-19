      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:21/01/2021
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NUMEROSDECIMALESYNEGATIVOS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      *Para poder ingresar valores negativos se pone una sdespues del PIC
      *y para especificar que son decimales se pone una v en medio de la especificacion de la longitud
      *del numero
      *Para suprimir los ceros a la izquierda podemos remplazar los 99 por ZZ
       01 A PIC S99V99.
       01 B PIC S99V99.
       01 RESULTADO PIC S99V99.

       PROCEDURE DIVISION.
       NEGATIVOS-POSITIVOS-DECIMALES.
           MOVE -10.15 TO A.
           MOVE -5.10 TO B.
           COMPUTE RESULTADO = A + B.
           DISPLAY RESULTADO.
            STOP RUN.
       END PROGRAM NUMEROSDECIMALESYNEGATIVOS.
