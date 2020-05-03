       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. coboltut.
AUTHOR. NANDO BINGANI .
DATE-WRITTEN.April 28.
 
ENVIRONMENT DIVISION.

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 UserName PIC X(30) VALUE "NANDO".
*>FIGURATIVE CONSTANTS
*> ZERO,ZEROS
*> SPACE,SPACES
*> HIGH-VALUES
*> LOW-VALUES
01 Num1    PIC 9 VALUE 3.
01 Num2    PIC 9 VALUE 6.
01 Total   PIC 99 VALUE 0.
01 SSNum.
       02 SSArea PIC 999.
       02 SSGroup PIC 99.
       02 SSSerial PIC 9999.
01 PIValue CONSTANT AS 3.14.

PROCEDURE DIVISION.
       DISPLAY "What is your name " WITH NO ADVANCING
       DISPLAY "Hello " UserName "Welcom to the Cobol World!!!"
       
       COMPUTE Total=Num1+Num2
       
       DISPLAY "Total : " Total
       
       MOVE 123456789 TO SSNum.
       DISPLAY 'SSArea :' SSArea
STOP RUN.   
