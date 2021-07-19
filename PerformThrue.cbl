      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:21/01/2021
      * Purpose:Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *PERFORM THRU permite llamar a dos rutinas al mismo tiempo
       PROGRAM-ID. PERFORM-THRU.
       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
      *Declaracion de variables
       01 NOMBRE PIC X(15).
       01 APELLIDO PIC X(20).
       01 EDAD PIC 99.

       PROCEDURE DIVISION.

       SOLICITA-DATOS.
       PERFORM SOLICITA-NOMBRE THRU SOLICITA-APELLIDOS.
       PERFORM SOLICITA-EDAD.
       DISPLAY "Nombre: " NOMBRE "Apellidos: " APELLIDO "Edad: " EDAD.

            STOP RUN.

       SOLICITA-NOMBRE.
           DISPLAY "Introduce tu nombre:"
           ACCEPT NOMBRE.

       SOLICITA-APELLIDOS.
           DISPLAY "Introduce tus apellidos:"
           ACCEPT APELLIDO.

       SOLICITA-EDAD.
           DISPLAY "Ingresa tu edad:"
           ACCEPT EDAD.
       END PROGRAM PERFORM-THRU.
