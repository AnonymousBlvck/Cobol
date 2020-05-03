       >>SOURCE FORMAT FREE
*> Looping For Loop and while loop.
IDENTIFICATION DIVISION.
PROGRAM-ID. coboltut.
AUTHOR. NANDO BINGANI .
DATE-WRITTEN.April 28.
 
ENVIRONMENT DIVISION.

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 Ind PIC 9 VALUE 0.

PROCEDURE DIVISION.
*> While loop.
PERFORM OutputData WITH TEST AFTER UNTIL Ind > 5
       GO TO ForLoop.
OutputData.
       DISPLAY Ind "From Output 1".
       ADD 1 TO Ind.
ForLoop.
       PERFORM OutputData2 VARYING Ind FROM 1 BY 1 UNTIL Ind=5
       STOP RUN.

OutputData2.
       DISPLAY Ind "From Output 2".    


