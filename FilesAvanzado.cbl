      ******************************************************************
      * Author: Jossie Esteban Rodriguez
      * Date: 28/02/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMERCIO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
                   SELECT F-ARCHIVO
      *             ASSIGN to WS-NOMBRE-ARCHIVO.
                   ASSIGN TO "C:\Users\Esteban\COBOL\DATOS2.TXT"
      *ORGANIZACION Y LECTURA DEL ARCHIVOS, SEQUENTIAL, RANDOM, INDEXED
                   ORGANIZATION INDEXED
                   ACCESS MODE RANDOM
      *CONFIGURACION DE LLAVE UNICA, VALORES QUE NO SE REPITEN
                   RECORD KEY IS RP-ID
      *CONFIGURACION DE OTROS CAMPOS QUE NO SE PUEDEN REPETIR
                   ALTERNATE RECORD KEY RP-NOMBRE
                   FILE STATUS WS-STATUS.
      *   SELECT F-ARCHIVO ASSIGN TO WS-NOMBRE-ARCHIVO PARA CONFIGURAR UNA DIRECCION DEL ARCHIVO
                   SELECT KEY-FILE
                   ASSIGN TO "C:\Users\Esteban\COBOL\LLAVE.TXT"
                   FILE STATUS KEY-STATUS.


       DATA DIVISION.
       FILE SECTION.
      *CONFIGURACION DE EFICIENCIA DE ARCHIVO
       FD F-ARCHIVO
       BLOCK CONTAINS 316 RECORDS
       RECORD CONTAINS 177 CHARACTERS.
      *BLOQUE MAXIMO 27998 POSICIONES (CARACTERES), 1 CARACTER = 8 BITS - 1 BYTE.
      * TAMAÑO DE REGISTRO 177 POSICIONES.
      * BLOQUE OPTIMO -> LONGITUD BLOQUE MAXIMO / TAMAÑO REGISTRO
      *BLOQUE OPTIMO -> 27998 POS / 177 POS = 158.18 = 158
      *->BLOQUE OPTIMO * TAMAÑO DE REGISTRO
      * ->158 * 177 = 27966 POSICIONES BLOQUE OPTIMO
      * TRACK COMPLETO = 27966 * 2 = 55992 -> PISTA COMPLETA
      *FACTOR DE BLOQUEO = 158 * 2 = 318 REGISTROS.

       01 REG-PRODUCTO.
                   02 RP-ID                PIC 9(10).
                   02 RP-NOMBRE            PIC X(50).
                   02 RP-PRECIO            PIC 9(05)V9(02).
                   02 RP-CANTIDAD          PIC 9(10).
                   02 RP-DESCRIPCION       PIC X(100).

       FD KEY-FILE.
       01 REG-LLAVE                        PIC 9(10).

       WORKING-STORAGE SECTION.
      *VARIABLES AUXILIARES  PARA ARCHIVOS
      *PARA DAR EXTENCIÓN DEL ARCHIVO DE FORMA PERSONALIZADA
      * 01 WS-NOMBRE-ARCHIVO.
      *             02 WS-DIRECTORIO-INI   PIC X(34)
      *                       VALUE "C:\Users\Esteban\COBOL\DATOS2.TXT\".
      *             02 WS-ID-ARCHIVO      PIC X(14)
      *             VALUE "DATOS-COMERCIO".
      *             02 WS-FECHA-ARC       PIC 9(06) VALUE ZEROS.
      *             02 FILLER             PIC X(04) VALUE ".TXT".
      *VARIABLE STATUS PARA VER LOS ERRORES QUE PUEDA TENER EL ARCHIVO
       77 WS-STATUS                        PIC 9(02).
       77 KEY-STATUS                       PIC 9(02).
       01 WS-PRODUCTO.
                   02 WS-ID                PIC 9(10).
                   02 WS-NOMBRE            PIC X(50).
                   02 WS-PRECIO            PIC 9(05)V9(02).
                   02 WS-CANTIDAD          PIC 9(10).
                   02 WS-DESCRIPCION       PIC X(100).
      *VARIABLES DE USO GENERAL


      *CONTADORES



       PROCEDURE DIVISION.
       SECCION-PRENCIPAL SECTION.

       MENU-PRINCIPAL.

            DISPLAY "TECNOLOGY SHOPPING JER. "
            PERFORM 001-INICIALIZACIONES.


            STOP RUN.


       001-INICIALIZACIONES.
       END PROGRAM COMERCIO.
