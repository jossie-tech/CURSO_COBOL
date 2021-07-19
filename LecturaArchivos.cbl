******************************************************************
      * Author: Jossie Esteban Rodriguez
      * Date: 21/02/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARCHIVOSDB.

      *Configuracion para carga de archivos externos
      *Seccion de especificaciones del archivo fisico en el disco empieza a defnirse en ENVIRONMENT DIVISION

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
      * Con SELECT OPTIONAL damos un nombre al archivo y lo asignamos con ASSIGN TO "" al archivo fisico
      * Con ORGANIZATION IS SEQUENTIAL la organizacion del archivo es ecuensial, desde el primer registro hasta el ultimo
       FILE-CONTROL.
       SELECT OPTIONAL EMPLEADOS-ARCHIVO
      *Especificamos la ruta donde se creara el archivo
       ASSIGN TO "C:\Users\Esteban\empleados.csv"
       ORGANIZATION IS SEQUENTIAL.

      *Especificaciones del archivo logico de la DB se definen en la DATA DIVISION
      *Descripcion de registro de datos con variables compuestas
       DATA DIVISION.
       FILE SECTION.
      *La palabra reservada FD sirve para especificar la definicion del archivo (description file)
       FD EMPLEADOS-ARCHIVO.
           01 EMPLEADOS-REGISTRO.
      *Campos de la DB donde se guardaran los datos
               05 EMPLEADOS-ID PIC X(6).
               05 EMPLEADOS-NOMBRE PIC X(25).
               05 EMPLEADOS-APELLIDOS PIC X(35).
               05 EMPLEADOS-EDAD PIC X(3).
               05 EMPLEADOS-TELEFONO PIC X(9).
               05 EMPLEADOS-DIRECCION PIC X(35).

       WORKING-STORAGE SECTION.
       01 PRESENTACION.
           05 TEXTO-ID PIC X(6) VALUE "ID: ".
           05 MUESTRA-ID PIC X(6).
           05 TEXTO-NOMBRE PIC X(9) VALUE "Nombre: ".
           05 MUESTRA-NOMBRE PIC X(15).
           05 TEXTO-APELLIDOS PIC X(12) VALUE "Apellidos: ".
           05 MUESTRA-APELLIDOS PIC X(20).
           05 TEXTO-EDAD PIC X(6) VALUE "Edad: ".
           05 MUESTRA-EDAD PIC X(3).
           05 TEXTO-TELEFONO PIC X(11) VALUE "Telefono: ".
           05 MUESTRA-TELEFONO PIC X(10).
           05 TEXTO-DIRECCION PIC X(12) VALUE "Direccion: ".
           05 MUESTRA-DIRECCION PIC X(35).

           01 FIN-DEL-ARCHIVO PIC X.
           01 MAXIMO-REGISTROS PIC 99.
           01 GUARDAR-ENTER PIC X.

           PROCEDURE DIVISION.

           EMPIEZA-PROGRAMA.
               PERFORM APERTURA-ARCHIVO.
               MOVE ZEROES TO MAXIMO-REGISTROS.
               MOVE "1" TO FIN-DEL-ARCHIVO.
               PERFORM LEE-SIGUIENTE-REGISTRO.
               PERFORM MUESTRA-REGISTROS
               UNTIL FIN-DEL-ARCHIVO = "0".
               PERFORM CIERRE-ARCHIVO.
               PROGRAM-DONE.
                   STOP RUN.

           APERTURA-ARCHIVO.
               OPEN INPUT EMPLEADOS-ARCHIVO.

           CIERRE-ARCHIVO.
               CLOSE EMPLEADOS-ARCHIVO.

           MUESTRA-REGISTROS.
           PERFORM MUESTRA-CAMPOS.
           PERFORM LEE-SIGUIENTE-REGISTRO.

           MUESTRA-CAMPOS.
               IF MAXIMO-REGISTROS = 10
                   PERFORM PULSAR-ENTER.
                   MOVE EMPLEADOS-ID TO MUESTRA-ID.
                   MOVE EMPLEADOS-NOMBRE TO MUESTRA-NOMBRE.
                   MOVE EMPLEADOS-APELLIDOS TO MUESTRA-APELLIDOS.
                   MOVE EMPLEADOS-EDAD TO MUESTRA-EDAD.
                   MOVE EMPLEADOS-TELEFONO TO MUESTRA-TELEFONO.
                   MOVE EMPLEADOS-DIRECCION TO MUESTRA-DIRECCION.
                   DISPLAY PRESENTACION.
                   ADD 1 TO MAXIMO-REGISTROS.
      *La palabra reservada READ realiza la lectura de los registros del archivo

           LEE-SIGUIENTE-REGISTRO.
               READ EMPLEADOS-ARCHIVO NEXT RECORD
               AT END
               MOVE "0" TO FIN-DEL-ARCHIVO.

           PULSAR-ENTER.
              DISPLAY
              "Presione la tecla ENTER para ver la siguiente pagina...".
              ACCEPT GUARDAR-ENTER.
              MOVE ZEROES TO MAXIMO-REGISTROS.

           END PROGRAM ARCHIVOSDB.
