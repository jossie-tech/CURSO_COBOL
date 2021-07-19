      ******************************************************************
      * Author: Jossie Esteban Rodriguez
      * Date: 21/02/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DIVISION_DE_PROCEDIMIENTOS.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 SALUDO PIC A(22).
       01 TITULO PIC A(40) VALUE 'Tutorial de COBOL'.
       01 NUMERO PIC 9(1) VALUE 5.

       PROCEDURE DIVISION.
            DISPLAY "Hello world"
            MOVE "Buena suerte." TO SALUDO.
            DISPLAY "Hola Jossie, " SALUDO.
            DISPLAY "Titulo: " TITULO.
            DISPLAY "Este es el tutorial: " NUMERO.
            STOP RUN.
       END PROGRAM DIVISION_DE_PROCEDIMIENTOS.