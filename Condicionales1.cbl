      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:21/01/2021
      * Purpose:Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CondicionalIF.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      *Declaración de variables.
       01 A PIC 9(4).
       01 B PIC 9(4).
       01 SUMA PIC 9(6).
       01 RESTA PIC 9(4).
       01 MUL PIC 9(8).
       01 DIV PIC 9(6).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      *Introducir los valores de A y B.
           DISPLAY "Introduce el valor de A"
           ACCEPT A.
           DISPLAY "Introduce el valor de B"
           ACCEPT B.
      *Suma.
           ADD A TO B GIVING SUMA.
      *Resta.
           SUBTRACT A FROM B GIVING RESTA.
      *Multiplicación.
           MULTIPLY A BY B GIVING MUL.
      *División.
           DIVIDE A INTO B GIVING DIV.
      *Visualización de resultados.
           IF SUMA > 50
               DISPLAY "El resultado es mayor de 50"
           ELSE
               DISPLAY "El resultado es menor de 50"
           END-IF.
           DISPLAY "El resultado de la suma es " SUMA.
           DISPLAY "El resultado de la resta es " RESTA.
           DISPLAY "El resultado de la multiplicacion es " MUL.
           DISPLAY "El resultado de la division es " DIV.
            STOP RUN.
       END PROGRAM CondicionalIF.
