      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date: 28/02/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVALUATEREDEFINE.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 A PIC 9(5) VALUE 5.
      *La palabra reservada REDEFINE cambia el tipo de dato de una variable
       77 D REDEFINES A PIC X(7).
       77 B PIC 9(5) VALUE 20.
       77 C PIC 9(5) VALUE 20.



       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

      *La palabra reservada evaluate true funciona como un switch case

           EVALUATE TRUE
           WHEN A = 5
           COMPUTE A = A + B + C
           DISPLAY A
           DISPLAY D

           WHEN A = 10
           COMPUTE A = A * B
           DISPLAY A

           WHEN A = 15
           COMPUTE A = B - C
           DISPLAY A

           WHEN OTHER
           DISPLAY "Valor no completado."

           END-EVALUATE.

            STOP RUN.
       END PROGRAM EVALUATEREDEFINE.
