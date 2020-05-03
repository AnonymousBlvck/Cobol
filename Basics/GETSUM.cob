       >>SOURCE FORMAT FREE
*> Sub routines and separate programmes passing values back and forth.
*> Compile this one with a -m and the main program with a -x.
IDENTIFICATION DIVISION.
PROGRAM-ID. GETSUM.
AUTHOR. NANDO BINGANI .
DATE-WRITTEN.April 28.
 
ENVIRONMENT DIVISION.

DATA DIVISION.
LINKAGE SECTION.
       01 LNum1 PIC 9 VALUE 5.
       01 LNum2 PIC 9 VALUE 4.
       01 LSum1 PIC VALUE 99.

PROCEDURE DIVISION USING USING LNum1,LNum2,LSum1.
       COMPUTE LSum1=LNum1+LNum2.
EXIT PROGRAM.