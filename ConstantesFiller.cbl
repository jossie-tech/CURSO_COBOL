      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:22/01/2021
      * Purpose:Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONSTANTESFILLER.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      *Con la palabra reservada FILLER no se puede cambiar de valor la variable en el programa
       01 VARIABLE-COMPUESTA.
           05 TXT01 PIC X(15) VALUE "Texto 1 - ".
           05 FILLER PIC X(15) VALUE "Texto FILLER".
           05 TXT02 PIC X(15) VALUE "Texto 2.".

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY VARIABLE-COMPUESTA.
            MOVE "Nuevo valor01 - " TO TXT01.
            MOVE "Nuevo valor02 - " TO TXT02.
      *     MOVE "Nuevo valor - " TO FILLER.
            DISPLAY VARIABLE-COMPUESTA.
            STOP RUN.
       END PROGRAM CONSTANTESFILLER.
