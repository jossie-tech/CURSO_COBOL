      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:21/01/2021
      * Purpose:Curso
      * Tectonics: cobc
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL.
       AUTHOR. Jossie Esteban Rodriguez
       INSTALLATION.
       DATE-WRITTEN. 21/01/2021
       DATE-COMPILED. 21/01/2021
       REMARKS. Reconocer la estructura del lenguaje cobol.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. Ordenador donde se escribio el código.
       OBJECT-COMPUTER. Ordenador donde se ejecutara el código.
       SPECIAL-NAMES.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT [OPTIONAL] Nombre-del-archivo.
       ASSIGN TO Tipo-de-organización.
       ORGANIZATION IS Tipo-de-organización.
       ACCES MODE IS Modo-de-acceso-al-archivo.
       RECORD KEY IS Clave-del-registro.
       ALTERNATE RECORD KEY IS Claves-alternativas-del-registro.
       WITH DUPLICATES
       STATUS IS. Varible-de-estado-del-archivo.


       DATA DIVISION.
       FILE SECTION. Campos-de-registro-de-archivos.
       WORKING-STORAGE SECTION. Variables-del-programa.



       PROCEDURE DIVISION. Variables-que-enlaza-al-programa-principal.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            MOVE "Introduccion a COBOL" To SALUDO.
            DISPLAY "Buena suerte" SALUDO.
            STOP RUN.
       END PROGRAM COBOL.
