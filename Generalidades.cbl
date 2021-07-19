      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:  18/02/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-NOMBRE                                    PIC A(30).
       01 WS-REGISTRO-EMPLEADO.
                   02 WS-NOMBRE-EMPLEADO.
                               03 WS-APE-EMP           PIC A(30).
                               03 WS-NOM-EMP           PIC A(30).
                   02 WS-EDAD                          PIC 9(02).
                   02 WS-SUELDO                        PIC 9(07)V9(2).

       01 WS-BANDERA                                   PIC 9(01).
                   88 WS-TRUE              VALUE 1.
                   88 WS-FALSE             VALUE 0.
       77 WS-GASTOS                                    PIC 9(05)V9(2).
       77 WS-HORAS                                     PIC 9(10).

       PROCEDURE DIVISION.
       REGISTRO.
            DISPLAY "Bienvenido"
            DISPLAY "Ingrese el apellido del empleado: "
            ACCEPT WS-APE-EMP.
            DISPLAY "Ingrese el nombre del empleado: "
            ACCEPT WS-NOM-EMP.
            DISPLAY "Ingrese la edad del empleado: "
            ACCEPT WS-EDAD.
            DISPLAY "Ingrese el sueldo del empleado: "
            ACCEPT WS-SUELDO.

            DISPLAY WS-REGISTRO-EMPLEADO.
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
