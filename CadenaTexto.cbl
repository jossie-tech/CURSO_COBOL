      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date: 02/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEXTOS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-NOMBRE                        PIC A(35).
       77 WS-CONTADOR                      PIC 9(02).


       PROCEDURE DIVISION.
       PRINCIPAL.
            DISPLAY "Dame tu nombre completo".
            ACCEPT WS-NOMBRE.
            INSPECT WS-NOMBRE TALLYING WS-CONTADOR FOR CHARACTERS.
            DISPLAY "La longitus de tu nombre es: " WS-CONTADOR.
            MOVE ZERO TO WS-CONTADOR.

            INSPECT WS-NOMBRE TALLYING WS-CONTADOR FOR ALL "A".
            DISPLAY "Cantidad de letras a: " WS-CONTADOR.
            MOVE ZERO TO WS-CONTADOR.

            INSPECT WS-NOMBRE TALLYING WS-CONTADOR FOR CHARACTERS BEFORE
            INITIAL " ".
            DISPLAY "La longitud de tu primer nombre es: " WS-CONTADOR.
            MOVE ZERO TO WS-CONTADOR.

            INSPECT WS-NOMBRE TALLYING WS-CONTADOR FOR CHARACTERS AFTER
            INITIAL " ".
            DISPLAY "El resto de tu nombre tiene: " WS-CONTADOR.
            MOVE ZERO TO WS-CONTADOR.
      *contiene j el texto
            INSPECT WS-NOMBRE TALLYING WS-CONTADOR FOR LEADING "J".
            DISPLAY "La cadena de texto contiene j? 0=no / 1=si"
            WS-CONTADOR.

            DISPLAY "Dame cadena de texto 1:".
            ACCEPT WS-NOMBRE.
            DISPLAY "Dame cadena de texto oriiginal 1:" WS-NOMBRE
            INSPECT WS-NOMBRE REPLACING CHARACTERS BY "A".
            DISPLAY "Cadena de texto remplazada: "WS-NOMBRE.

            DISPLAY "Dame cadena de texto 2:".
            ACCEPT WS-NOMBRE.
            DISPLAY "Dame cadena de texto oriiginal 2:" WS-NOMBRE
            INSPECT WS-NOMBRE REPLACING ALL "E" BY "A"
            DISPLAY "Cadena con remplazo:  " WS-NOMBRE

            DISPLAY "Dame cadena de texto 3:".
            ACCEPT WS-NOMBRE.
            DISPLAY "Dame cadena de texto oriiginal 3:" WS-NOMBRE
            INSPECT WS-NOMBRE REPLACING FIRST "J" BY "F".
            DISPLAY "Cadena con remplazo:  " WS-NOMBRE

            DISPLAY "Dame cadena de texto 4:".
            ACCEPT WS-NOMBRE.
            DISPLAY "Dame cadena de texto oriiginal 4:" WS-NOMBRE
            INSPECT WS-NOMBRE REPLACING ALL "HOLA" BY "BYE-" AFTER
            INITIAL " " BEFORE INITIAL "M"
            DISPLAY "Cadena con remplazo:  " WS-NOMBRE


            MOVE ZERO TO WS-CONTADOR.
            DISPLAY "Dame cadena de texto 5:".
            ACCEPT WS-NOMBRE.
            DISPLAY "Dame cadena de texto oriiginal 5:" WS-NOMBRE
            INSPECT WS-NOMBRE TALLYING WS-CONTADOR FOR ALL "E"
            REPLACING ALL "E" BY "A" BEFORE INITIAL "M."
            DISPLAY "Cadena con remplazo:  " WS-NOMBRE,
            "Letras remplazadas " WS-CONTADOR.

            MOVE ZERO TO WS-CONTADOR.
            DISPLAY "Dame cadena de texto 6:".
            ACCEPT WS-NOMBRE.
            INSPECT WS-NOMBRE CONVERTING "AOI" TO "EUY".
            DISPLAY "Cadena con remplazo:  " WS-NOMBRE,
            INSPECT WS-NOMBRE CONVERTING "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            TO "abcdefghijklmnopqrstuvwxyz".
            DISPLAY "Cadena con remplazo:  " WS-NOMBRE,
            STOP RUN.
       END PROGRAM TEXTOS.
