      ******************************************************************
      * Author:Jossie Esteban Rodriguez
      * Date:21/01/2021
      * Purpose: Curso
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ASIGNARMULTIPLESVALORES.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 A PIC 99.
       01 B PIC 99.
       01 C PIC 99.
       01 D PIC 99.
       01 E PIC 99.
       01 I PIC 99.
       01 G PIC 99.
       01 H PIC 99.
       01 J PIC 99.
       01 TEXTO PIC XX VALUE SPACES.
       01 Z PIC 99 VALUE ZEROES.
       PROCEDURE DIVISION.
      *Asignamos el valor de 10 a las variables que quiera separadas por espacio
      *Las variables es mejor dejarals iniciadas en cobol
      *las palabras reservadas SPACE o SPACES inicializan las variables con un espacio
      *Las palabras ZEOR y ZEROES inicilazan las variables numericas en cero
       RUTINA1.
           MOVE 10 TO A B C D E I G H J.

      *     DISPLAY TEXTO.
           DISPLAY A.
           DISPLAY B.
           DISPLAY C.
           DISPLAY D.
           DISPLAY E.
           DISPLAY I.
           DISPLAY G.
           DISPLAY H.
           DISPLAY J.
           DISPLAY Z.
               STOP RUN.
       END PROGRAM ASIGNARMULTIPLESVALORES.
