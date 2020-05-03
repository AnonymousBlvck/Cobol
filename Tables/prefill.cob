       >>SOURCE FORMAT FREE       
IDENTIFICATION DIVISION.
PROGRAM-ID. tables.

DATA DIVISION.

WORKING-STORAGE SECTION.
01 ProdTable.
       02 ProdData.
           03 FILLER PIC X(8) VALUE "RED  SML".
           03 FILLER PIC X(8) VALUE "BLUE SML".
           03 FILLER PIC X(8) VALUE "GREENSML".
       02 FILLER REDEFINES ProdData.
           03 Shirt OCCURS 3 TIMES.
               04 ProdName PIC X(5).
               04 ProdSizes PIC A OCCURS 3 TIMES.
01 ChangeMe.
       02 TextNum PIC X(6).
       02 FloatNum REDEFINES TextNum PIC 9(4)V99.

PROCEDURE DIVISION.
       DISPLAY Shirt(1).
       MOVE 123456 TO TextNum.
       DISPLAY FloatNum.


STOP RUN.
