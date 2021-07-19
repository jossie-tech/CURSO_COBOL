      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:25/01/2021
      * Purpose:Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NOMINA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-DATOS-TRABAJADOR OCCURS 100 TIMES DEPENDING ON WS-FIN
       INDEXED BY WS-INDICE.
           02 WS-ID                        PIC 9(03).
           02 WS-NOMBRE                    PIC X(30).
           02 WS-APELLIDO                  PIC X(30).
           02 WS-EDAD                      PIC 9(02).
           02 WS-SALARIO                   PIC S9(06)V99.
           02 WS-DEPARTAMENTO              PIC 9(2) OCCURS 3 TIMES.
       77 WS-FIN                           PIC 9(03).
       77 WS-SAL-FORMATO                   PIC ZZZZ9.99.
       77 WS-CONTADOR                      PIC 9(02).
       77 WS-TERMINA                       PIC 9(01).
       77 WS-RECORRE                       PIC 9(03).
       77 WS-ID-SEARCH                     PIC 9(03).
       77 WS-COL                           PIC 9(1).
       77 WS-ELECCION                      PIC 9(1).
       77 WS-INDICADOR                     PIC 9(01).
       01 WS-OPCION                        PIC A(01) VALUE SPACE.
           88 WS-OPC-ALTA                  VALUE 'A'.
           88 WS-OPC-CONSULTA              VALUE 'C'.
           88 WS-OPC-S                     VALUE 'S'.
           88 WS-OPC-N                     VALUE 'N'.
           88 WS-OPC-CONSULTA-TRABAJADOR   VALUE 'T'.
           88 WS-OPC-M                     VALUE 'M'.
           88 WS-OPC-B                     VALUE 'B'.

       77 WS-NUEVO-NOMBRE                  PIC X(30).
       77 WS-NUEVO-APELLIDO                PIC X(30).
       77 WS-NUEVO-EDAD                    PIC 9(02).
       77 WS-NUEVO-SALARIO                 PIC S9(06)V99.
       77 WS-NUEVO-DEPARTAMENTO            PIC 9(2).
       PROCEDURE DIVISION.

       00-PRINCIPAL.

           DISPLAY "NOMINA TRABAJADORES".
           MOVE ZERO TO WS-TERMINA
                        WS-FIN
           PERFORM 03-MENU UNTIL WS-TERMINA = 1.

           STOP RUN.

       03-MENU.
           DISPLAY "A - Altas, C - Consulta general, T - Consulta"
      -    "trabajador, M - Modificar trabajador, B - Baja, S - Salir".
           ACCEPT WS-OPCION.
           IF WS-OPC-ALTA
                   PERFORM 01-CAPTURATRABAJADOR
           ELSE
           IF WS-OPC-CONSULTA
                   MOVE 1 TO WS-RECORRE
                   PERFORM 02-CONSULTATRABAJADOR
                   UNTIL WS-RECORRE > WS-FIN
           ELSE
           IF WS-OPC-CONSULTA-TRABAJADOR
                   PERFORM 05-CONSULTAESPECIIFICA
           ELSE
           IF WS-OPC-M
                   PERFORM 09-MODIFICARTRABAJADOR
           ELSE
           IF WS-OPC-B
                   PERFORM 14-BAJA-TRABAJADOR
           ELSE
           IF WS-OPC-S
                   MOVE 1 TO WS-TERMINA
           ELSE
                   DISPLAY "Opcion invalida, verifique".


       01-CAPTURATRABAJADOR.
           ADD 1 TO  WS-FIN.
           IF WS-FIN > 100
                   DISPLAY "Ya no se pueden registrar mas"
      -            "trabajadores, contacte a sistemas"
           ELSE
                   DISPLAY "Ingrese el nombre del trabajador: "
                   ACCEPT WS-NOMBRE(WS-FIN)

                   DISPLAY "Ingrese los apellidos del trabajador: "
                   ACCEPT WS-APELLIDO(WS-FIN)

                   DISPLAY "Ingrese la edad del trabajador: "
                   ACCEPT WS-EDAD(WS-FIN)

                   DISPLAY "Ingrese el sueldo del trabajador: "
                   ACCEPT WS-SALARIO(WS-FIN)

                   MOVE 1 TO WS-COL
                   PERFORM 06-CAPTURA-DTO UNTIL WS-COL > 3.

                   ADD 10 TO WS-CONTADOR
                   MOVE WS-CONTADOR TO WS-ID(WS-FIN)
                   PERFORM 04-NUEVOREGISTRO.

       04-NUEVOREGISTRO.
           DISPLAY "Desea registrar un nuevo trabajador? S-SI, N-NO".
           ACCEPT WS-OPCION.

           IF WS-OPC-S
                   PERFORM 01-CAPTURATRABAJADOR
           ELSE
           IF WS-OPC-N
                   NEXT SENTENCE
           ELSE
                   DISPLAY "Opcion invalida, verifique"
                   PERFORM 04-NUEVOREGISTRO.

       02-CONSULTATRABAJADOR.
           IF WS-ID(WS-RECORRE) > 0
                   DISPLAY "ID: " WS-ID(WS-RECORRE)
                   DISPLAY "NOMBRE: " WS-NOMBRE(WS-RECORRE)
                   DISPLAY "APELLIDOS: " WS-APELLIDO(WS-RECORRE)
                   DISPLAY "EDAD: " WS-EDAD(WS-RECORRE)
                   MOVE WS-SALARIO(WS-RECORRE) TO WS-SAL-FORMATO
                   DISPLAY "SUELDO: " WS-SAL-FORMATO
                   MOVE 1 TO WS-COL
                   PERFORM 08-CONS-DTO-GRAL UNTIL WS-COL > 3.

           ADD 1 TO  WS-RECORRE.

       05-CONSULTAESPECIIFICA.
           DISPLAY "Indica el ID del trabajador".
           ACCEPT WS-ID-SEARCH.
           SET WS-INDICE TO 1
           SEARCH WS-DATOS-TRABAJADOR
           AT END DISPLAY "Trabajador no encontrado"
           WHEN WS-ID(WS-INDICE) = WS-ID-SEARCH
           DISPLAY "ID: " WS-ID(WS-INDICE)
           DISPLAY "NOMBRE: " WS-NOMBRE(WS-INDICE)
           DISPLAY "APELLIDOS: " WS-APELLIDO(WS-INDICE)
           DISPLAY "EDAD: " WS-EDAD(WS-INDICE)
           MOVE WS-SALARIO(WS-INDICE) TO WS-SAL-FORMATO
           DISPLAY "SUELDO: " WS-SAL-FORMATO
           MOVE 1 TO WS-COL
           PERFORM 08-CONS-DTO-ESP UNTIL WS-COL > 3
           IF WS-INDICADOR = 1
                   PERFORM 13-MODIFICACION
                   MOVE ZERO TO WS-INDICADOR
           ELSE
           IF WS-INDICADOR = 2
                   PERFORM 15-BAJAS
                   MOVE ZERO TO WS-INDICADOR.

       06-CAPTURA-DTO.

           IF WS-COL > 3
                   DISPLAY "Solo puede ingresar 3 departamentos"
           ELSE
                   DISPLAY"Ingresa el departamento del trabajador: "
                   ACCEPT WS-DEPARTAMENTO(WS-FIN, WS-COL).
                   PERFORM 07-OTRO-DEPARTAMENTO.

       07-OTRO-DEPARTAMENTO.
           DISPLAY "Desea ingresar otro departamento? S-SI / N-NO".
           ACCEPT WS-OPCION.

           IF WS-OPC-S
                   ADD 1 TO WS-COL
                   PERFORM 06-CAPTURA-DTO
           ELSE
           IF WS-OPC-N
                       MOVE 4 TO WS-COL
           ELSE
                       DISPLAY "Opcion invalida, verifique"
                       PERFORM 07-OTRO-DEPARTAMENTO.

       08-CONS-DTO-GRAL.
           IF WS-DEPARTAMENTO(WS-RECORRE, WS-COL) NOT = ""
           OR WS-DEPARTAMENTO(WS-RECORRE, WS-COL) NOT = SPACES
                   DISPLAY "DEARTAMENTO " WS-COL ": "
                   DISPLAY WS-DEPARTAMENTO(WS-RECORRE, WS-COL)
                   ADD 1 TO WS-COL
           ELSE
                   MOVE 4 TO WS-COL.

       08-CONS-DTO-ESP.
           IF WS-DEPARTAMENTO(WS-INDICE, WS-COL) NOT = ""
           OR WS-DEPARTAMENTO(WS-INDICE, WS-COL) NOT = SPACES
                   DISPLAY "DEARTAMENTO " WS-COL ": "
                   DISPLAY WS-DEPARTAMENTO(WS-INDICE, WS-COL)
                   ADD 1 TO WS-COL
           ELSE
                   MOVE 4 TO WS-COL.

       09-MODIFICARTRABAJADOR.
           MOVE 1 TO WS-INDICADOR.
           PERFORM 05-CONSULTAESPECIIFICA.

       13-MODIFICACION.
           DISPLAY "¿Que desea modificar?: 1-NOMBRE, 2-APELLIDO, "
      -            "3-EDAD, 4-SALARIO, 5-DEPARTAMENTO, 6-CANCELAR ".

           ACCEPT WS-ELECCION.

           IF WS-ELECCION = 1
                   DISPLAY "Ingrese el nuevo nombre del trabajador: "
                   ACCEPT WS-NUEVO-NOMBRE
                   MOVE WS-NUEVO-NOMBRE TO WS-NOMBRE(WS-INDICE)
           ELSE
           IF WS-ELECCION = 2
                   DISPLAY "Ingrese el nuevo apellido del trabajador: "
                   ACCEPT WS-NUEVO-APELLIDO
                   MOVE WS-NUEVO-APELLIDO TO WS-APELLIDO(WS-INDICE)
           ELSE
           IF WS-ELECCION = 3
                   DISPLAY "Ingrese la nueva edad del trabajador: "
                   ACCEPT WS-NUEVO-EDAD
                   MOVE WS-NUEVO-EDAD TO WS-EDAD(WS-INDICE)
           ELSE
           IF WS-ELECCION = 4
                   DISPLAY "Ingrese el nuevo sueldo del trabajador: "
                   ACCEPT WS-NUEVO-SALARIO
                   MOVE WS-NUEVO-SALARIO TO WS-SALARIO(WS-INDICE)
           ELSE
           IF WS-ELECCION = 5
                   MOVE 1 TO WS-COL
                   PERFORM 10-MODIFICARDEPARTAMENTO UNTIL WS-COL > 3
                       ELSE
           IF WS-ELECCION = 6
                   NEXT SENTENCE
           ELSE
           DISPLAY "Opcion invalida, verifique"
           PERFORM 13-MODIFICACION.


       10-MODIFICARDEPARTAMENTO.
           IF WS-COL < 4
                   IF WS-DEPARTAMENTO(WS-INDICE, WS-COL) NOT = ""
                   OR WS-DEPARTAMENTO(WS-INDICE, WS-COL) NOT = SPACES
                   DISPLAY "Ingrese el nuevo departamento ", WS-COL ": "
                   ACCEPT WS-NUEVO-DEPARTAMENTO
                   MOVE WS-NUEVO-DEPARTAMENTO
                   TO WS-DEPARTAMENTO(WS-INDICE, WS-COL)
                   ADD 1 TO WS-COL
                   PERFORM 11-MOD-OTRO-DEPARTAMENTO
           ELSE
                   DISPLAY "Solo se pyueden ingresar 3 departamentos".

       11-MOD-OTRO-DEPARTAMENTO.
                DISPLAY "Desea ingresar otro departamento? S-SI / N-NO"
                ACCEPT WS-OPCION
                IF WS-OPC-S
                   PERFORM 10-MODIFICARDEPARTAMENTO
                ELSE
                IF WS-OPC-N
                   MOVE 4 TO WS-COL
                ELSE
                   DISPLAY "Opcion invalida, verifique"
                   PERFORM 11-MOD-OTRO-DEPARTAMENTO.

       14-BAJA-TRABAJADOR.
               MOVE 2 TO WS-INDICADOR.
               PERFORM 05-CONSULTAESPECIIFICA.

       15-BAJAS.
               DISPLAY "Desea eliminar este usuario " WS-ID(WS-INDICE)
               "? S-SI / N-NO. ".
               ACCEPT WS-OPCION.
               IF WS-OPC-S
                  MOVE LOW-VALUES TO WS-DATOS-TRABAJADOR (WS-INDICE)
               ELSE
               IF WS-OPC-N
               NEXT SENTENCE
               ELSE
               DISPLAY "Opcion erronea, verifique"
               PERFORM 15-BAJAS.

       17-CONFIGURACION.




       END PROGRAM NOMINA.
