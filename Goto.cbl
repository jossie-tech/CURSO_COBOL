      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:21/01/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. GOTO.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      *Declaración de variables
       01 SI-O-NO PIC X.

       PROCEDURE DIVISION.
      *
       PERFORM CONTINUACION.

       IF SI-O-NO = "N" OR SI-O-NO = "n"
      *GO TO va al parrafo y no vuelve a leer el programa en el parrafo de origen
      *PERFORM lee su propio parrafo y hace el salto a la rutina correspondiente
           GO TO FINALIZA-PROGRAMA.
       IF SI-O-NO = "S" OR SI-O-NO = "s"
           PERFORM PROGRAMA
       ELSE
           DISPLAY "Por favor, introduce una 'N' o 'S'".

       FINALIZA-PROGRAMA.
           STOP RUN.

       CONTINUACION.
           DISPLAY "¿Ejecutar el programa (S/N)?"
           ACCEPT SI-O-NO.

       PROGRAMA.
           DISPLAY "Se ejecuta el programa.".

       END PROGRAM GOTO.
