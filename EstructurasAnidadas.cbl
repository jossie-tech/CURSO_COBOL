      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:22/01/2021
      * Purpose:Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ESTRUCTURASANIDADAS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 VARIABLE-COMPUESTA.
           05 TXT01 PIC X(11) VALUE "Este texto ".
           05 TXT02 PIC X(36) VALUE
           "Pertenece a la estructura principal.".
           05 SUB-VARIABLE-COMPUESTA.
               10 TXT03 PIC X(11) VALUE "Este texto ".
               10 TXT04 PIC X(37) VALUE
               "Pertenece a la estructura secundaria.".
               10 SUB-SUB-VARIABLE-COMPUESTA.
                   15 TXT05 PIC X(37) VALUE
                   "Ultima estructura anidada. ".
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY VARIABLE-COMPUESTA.
            DISPLAY SUB-VARIABLE-COMPUESTA.
            DISPLAY SUB-SUB-VARIABLE-COMPUESTA.
            STOP RUN.
       END PROGRAM ESTRUCTURASANIDADAS.
