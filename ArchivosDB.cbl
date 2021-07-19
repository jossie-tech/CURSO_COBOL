      ******************************************************************
      * Author:
      * Date:
      * Purpose:
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

       01 IDENTIFICADOR PIC X(36)
           VALUE "Introduce un ID del nuevo empeado: ".
       01 NOMBRE PIC X(33)
           VALUE "Introduce un nombre de empleado: ".
       01 APELLIDOS PIC X(40)
           VALUE "Introduce los apellidos del empleado: ".
       01 EDAD PIC X(19)
           VALUE "Introduce la edad: ".
       01 TELEFONO PIC X(40)
           VALUE "Introduce un numero de telefono: ".
       01 DIRECCION PIC X(33)
           VALUE "Introduce una direccion: ".

       01 SI-NO PIC X.
       01 ENTRY-OK PIC X.


       PROCEDURE DIVISION.

       MAIN-LOGIC SECTION.
       PROGRAM-BEGIN.

       PERFORM PROCEDIMIENTO-DE-APERTURA.
       MOVE "S" TO SI-NO.
       PERFORM AGREGAR-REGISTROS
       UNTIL SI-NO = "N".
       PERFORM PROCEDIMIENTO-DE-CIERRE.

       PROGRAM-DONE.
           STOP RUN.
      *Para manipular un archivo lo primero que se debe hacer es abrirlo o crearlo EXTEND CREA O ABRE EL ARCHIVO EXISTENTE
       PROCEDIMIENTO-DE-APERTURA.
           OPEN EXTEND EMPLEADOS-ARCHIVO.

      *Cuando finalizamos su edicion debemos cerrarlo
       PROCEDIMIENTO-DE-CIERRE.
           CLOSE EMPLEADOS-ARCHIVO.

       AGREGAR-REGISTROS.
           MOVE "N" TO ENTRY-OK.
           PERFORM OBTENER-CAMPOS
           UNTIL ENTRY-OK = "S".
           PERFORM ESCRIBIR-REGISTROS.
           PERFORM REINICIAR.

       OBTENER-CAMPOS.
           MOVE SPACE TO EMPLEADOS-REGISTRO.
           DISPLAY IDENTIFICADOR " ? ".
           ACCEPT EMPLEADOS-ID.
           DISPLAY NOMBRE " ? ".
           ACCEPT EMPLEADOS-NOMBRE.
           DISPLAY APELLIDOS " ? ".
           ACCEPT EMPLEADOS-APELLIDOS.
           DISPLAY EDAD " ? ".
           ACCEPT EMPLEADOS-EDAD.
           DISPLAY TELEFONO " ? ".
           ACCEPT EMPLEADOS-TELEFONO.
           DISPLAY DIRECCION " ? ".
           ACCEPT EMPLEADOS-DIRECCION.
           PERFORM VALIDAR-CAMPOS.

       VALIDAR-CAMPOS.
           MOVE "S" TO ENTRY-OK.
           IF EMPLEADOS-NOMBRE = SPACE
               DISPLAY "Error: debes especificar un nombre."
           MOVE "N" TO ENTRY-OK.

      *Se emplea la palabra reservada WRITE para escribir los registros en el archivo
       ESCRIBIR-REGISTROS.
           WRITE EMPLEADOS-REGISTRO.

       REINICIAR.
           DISPLAY "¿Desea almacenar otro empleado en la base de datos?".
           ACCEPT SI-NO.
           IF SI-NO = "S"
               MOVE "S" TO SI-NO.
               IF SI-NO NOT = "S"
                   MOVE "N" TO SI-NO.


       END PROGRAM ARCHIVOSDB.
