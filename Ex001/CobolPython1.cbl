******************************************************************
      * Author:
      * Date:
      * Purpose: Gerado arquivo em python e lido com COBOL
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOLPYTHON1.
      *
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQUIVO ASSIGN TO
               'C:\COBOL-Python\Ex001\salarios.csv'
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS FS-ARQUIVO.
      *
       DATA DIVISION.
       FILE SECTION.
      *
       FD  ARQUIVO.
       01 REGISTRO         PIC X(23).
      *
       WORKING-STORAGE SECTION.
      *
       01  WS-REGISTRO.
           05 WS-ID        PIC 9(02).
           05 WS-NOME      PIC X(20).
           05 WS-SALARIO   PIC 9(05)V99.
       01  FILE-STATUS.
           05 FS-ARQUIVO   PIC 9(02).
       01  EOF             PIC X(01) VALUE 'N'.
       01 CABECALHO        PIC X(01) VALUE 'N'.
      *
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM ABRE-ARQUIVO.
           PERFORM UNTIL EOF = 'Y'
               PERFORM LE-ARQUIVO
               IF EOF NOT = 'Y'
                   IF CABECALHO = 'Y'
                       PERFORM UNSTRING-ARQUIVO
                       PERFORM MOSTRA-REGISTRO
                   END-IF
               END-IF
           MOVE 'Y' TO CABECALHO
           END-PERFORM.
           PERFORM FECHA-ARQUIVO.
           STOP RUN.
       ABRE-ARQUIVO.
           OPEN INPUT ARQUIVO.
       LE-ARQUIVO.
           IF FS-ARQUIVO = 00
               READ ARQUIVO INTO WS-REGISTRO
               AT END MOVE 'Y' TO EOF.
       UNSTRING-ARQUIVO.
           UNSTRING REGISTRO
               DELIMITED BY ','
               INTO
                   WS-ID,
                   WS-NOME,
                   WS-SALARIO
           END-UNSTRING.
       MOSTRA-REGISTRO.
           DISPLAY 'Id = 'WS-ID.
           DISPLAY 'Nome = 'WS-NOME.
           DISPLAY 'Salario = 'WS-SALARIO.
       FECHA-ARQUIVO.
           CLOSE ARQUIVO.
       END PROGRAM COBOLPYTHON1.
