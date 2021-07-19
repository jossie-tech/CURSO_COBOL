      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:25/01/2021
      * Purpose:Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULADORA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-A                             PIC S9(3).
       77 WS-B                             PIC S9(3).
       77 WS-RESULTADO                     PIC S9(4).
       77 WS-OPERACION                     PIC A(1).
       77 WS-RES-FORMATO                   PIC -ZZZZZZZZ9.99.
       77 WS-RESIDUO                       PIC 9(04).
       77 REINICIAR                        PIC A(1).
       PROCEDURE DIVISION.
       INICIO.
           DISPLAY "CALCULADORA".
      *     CONTROL "FCOLOR = WHITE".
           DISPLAY "Digite el primer numero: "
           ACCEPT WS-A.
           DISPLAY "Digite el segundo numero: "
           ACCEPT WS-B.
           DISPLAY "Para iniciar digite la inicial de la operacion: "
-          "s = suma, r = resta, m = multiplicacion, d = division,"
-          "l = modulo, p = potencia, z = raiz".
           ACCEPT WS-OPERACION.
           PERFORM OPERACION.

       OPERACION.
           EVALUATE TRUE
           WHEN WS-OPERACION = "s" OR WS-OPERACION = "S"
           PERFORM SUMA

           WHEN WS-OPERACION = "r" OR WS-OPERACION = "R"
           PERFORM RESTA

           WHEN WS-OPERACION = "m" OR WS-OPERACION = "M"
           PERFORM MULTIPLICACION

           WHEN WS-OPERACION = "d" OR WS-OPERACION = "D"
           PERFORM DIVISIONN

           WHEN WS-OPERACION = "p" OR WS-OPERACION = "P"
           PERFORM POTENCIA

           WHEN WS-OPERACION = "l" OR WS-OPERACION = "L"
           PERFORM MODULO

           WHEN WS-OPERACION = "z" OR WS-OPERACION = "Z"
           PERFORM RAIZ

           WHEN OTHER
           DISPLAY "Digite las iniciales indicadas al principio"
           PERFORM INICIO

           END-EVALUATE.

       SUMA.
           ADD WS-A TO WS-B GIVING WS-RESULTADO.
           PERFORM RESULTADO.

       RESTA.
           SUBTRACT WS-A FROM WS-B GIVING WS-RESULTADO.
           PERFORM RESULTADO.

       MULTIPLICACION.
           MULTIPLY WS-A BY WS-B GIVING WS-RESULTADO.
           PERFORM RESULTADO.

       DIVISIONN.
           DIVIDE WS-A INTO WS-B GIVING WS-RESULTADO.
           PERFORM RESULTADO.

       POTENCIA.
           COMPUTE WS-RESULTADO = WS-A ** WS-B.
           PERFORM RESULTADO.

       MODULO.
           DIVIDE WS-A INTO WS-B GIVING WS-RESULTADO
           REMAINDER WS-RESIDUO.
           PERFORM RESULTADO.

       RAIZ.
           COMPUTE WS-RESULTADO = WS-A ** (1/WS-B).
           PERFORM RESULTADO.

       RESULTADO.
           MOVE WS-RESULTADO TO WS-RES-FORMATO.
           DISPLAY "El resultado de la operacion es: " WS-RES-FORMATO.
           DISPLAY "¿Desea realizar una nueva operación? s/n "
           ACCEPT REINICIAR.
           PERFORM NUEVAOPERACION.


       NUEVAOPERACION.
           IF REINICIAR = "s" OR "S"
                   PERFORM INICIO
           ELSE
           IF REINICIAR = "n" OR "N"
                   PERFORM  SALIR
           ELSE
                   DISPLAY "Seleccione una opcion valida".
                   PERFORM NUEVAOPERACION.

       SALIR.
                   STOP RUN.

       END PROGRAM CALCULADORA.
