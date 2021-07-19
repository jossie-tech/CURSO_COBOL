      ******************************************************************
      * Author: Jossie Esteban Rodriguez
      * Date: 28/02/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILES.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
                   SELECT F-FILES
                   ASSIGN TO "C:\Users\Esteban\COBOL\DATOS.TXT".


       DATA DIVISION.
       FILE SECTION.
       FD F-FILES.
       01 REG-CLIENTE.
                   02 RC-NOMBRE            PIC A(30).
                   02 RC-APELLIDOS         PIC A(30).
                   02 RC-DIRECCION         PIC A(30).
                   02 RC-TELEFONO          PIC 9(10).


       WORKING-STORAGE SECTION.
       01 WS-CLIENTE.
                   02 WS-NOMBRE            PIC A(30).
                   02 WS-APELLIDOS         PIC A(30).
                   02 WS-DIRECCION         PIC A(30).
                   02 WS-TELEFONO          PIC 9(10).
                   02 WS-PASATIEMPO        PIC A(30).
                   02 WS-COLOR             PIC A(30).

       77 WS-CONCATENADO                   PIC A(150).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "PROGRAMA GENERADOR DE ARCHIVO CLIENTES.".

            DISPLAY "Ingresa el nombre del cliente: ".
            ACCEPT WS-NOMBRE.

      *      DISPLAY "Ingresa el apellido del cliente: ".
      *      ACCEPT WS-APELLIDOS.

            DISPLAY "Ingresa la direccion| del cliente: ".
            ACCEPT WS-DIRECCION.

            DISPLAY "Ingresa el telefono del cliente: ".
            ACCEPT WS-TELEFONO.

      *UNSTRING DIVIDE LOS CARACTERES COMO YO LO DETERMINE

            UNSTRING WS-NOMBRE DELIMITED BY " "
            INTO RC-NOMBRE RC-APELLIDOS

            DISPLAY "NOMBRE: " RC-NOMBRE.
            DISPLAY "APELLIDOS: " RC-APELLIDOS.

            MOVE WS-DIRECCION TO RC-DIRECCION.
            MOVE WS-TELEFONO TO RC-TELEFONO.

            DISPLAY "DIRECCION: " RC-DIRECCION.
            DISPLAY "TELEFONO: " RC-TELEFONO.

      *ABRIMOS EL ARCHIVO PARA GUARDAR LOS ARCHIVOS
           OPEN OUTPUT F-FILES.
           WRITE REG-CLIENTE.

           DISPLAY "Pasa tiempo favorito del cliente :"
           ACCEPT WS-PASATIEMPO.

           DISPLAY "Color favorito del cliente :"
           ACCEPT WS-COLOR.
      *STRING UNE CADENAS DE CARACTERES COMO YO LO DEFINA
           STRING "PASA TIEMPO: ", WS-PASATIEMPO, "COLOR: ", WS-COLOR
           DELIMITED BY SIZE INTO WS-CONCATENADO.

           MOVE LOW-VALUES TO REG-CLIENTE.

           WRITE REG-CLIENTE FROM WS-CONCATENADO.

           CLOSE F-FILES.

           DISPLAY "TERMINA PROGRAMA"
            STOP RUN.
       END PROGRAM FILES.
