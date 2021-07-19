      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:21/01/2021
      * Purpose:Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VARIABLECOMPUESTA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 VARIABLE-COMPUESTA.
           02 A PIC Z VALUE 2.
           02 B PIC Z VALUE 4.
           02 C PIC Z VALUE 6.
           02 D PIC Z VALUE 9.
       01 VARIABLE-COMPUESTA-TEXTO.
           02 TXT1 PIC X(13) VALUE "Programacion".
           02 TXT2 PIC X(5) VALUE "COBOL".
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY A.
           DISPLAY B.
           DISPLAY C.
           DISPLAY D.
           DISPLAY VARIABLE-COMPUESTA.

           DISPLAY TXT1.
           DISPLAY TXT2.
           DISPLAY VARIABLE-COMPUESTA-TEXTO.
            STOP RUN.
       END PROGRAM VARIABLECOMPUESTA.
