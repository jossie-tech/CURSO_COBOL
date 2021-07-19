      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:21/01/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RUTINAS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      *Funciona como metodos con codigo independiente que pueden ser llamados con la álabra reservada PERFORM
       RUTINA01.
           DISPLAY "Esta es la rutina 1."
           PERFORM RUTINA03.
       RUTINA02.
           DISPLAY "Esta es la rutina 2."
           PERFORM RUTINA04.
       RUTINA03.
           DISPLAY "Esta es la rutina 3."
           PERFORM RUTINA02.
       RUTINA04.
           DISPLAY "Esta es la rutina 4."
           DISPLAY "Finaliza el programa."
            STOP RUN.
       END PROGRAM RUTINAS.
