      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:21/01/2021
      * Purpose:Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DISPLAY-VARIABLES-CONSTANTES.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 SALUDO PIC X(19) VALUE "HOLA JOSSIE ESTEBAN".
       01 NUMERO PIC 9(4) VALUE 7777.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            DISPLAY SALUDO.
            DISPLAY NUMERO.
            STOP RUN.
       END PROGRAM DISPLAY-VARIABLES-CONSTANTES.
