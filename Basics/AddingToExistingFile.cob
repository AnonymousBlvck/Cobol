       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. coboltut10.
AUTHOR. NANDO BINGANI .
DATE-WRITTEN.April 28.
 
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       SELECT CustomerFile ASSIGN TO "Customer.dat"
       ORGANIZATION IS LINE SEQUENTIAL 
       ACCESS IS SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD CustomerFile.
01 CustomerData.
       02 IDNum. PIC 9(5).
       02 CustName.
           03 FirstName PIC X(15).
           03 LastName PIC X(15).

WORKING-STORAGE SECTION.
01 WSCustomer.
       02 WSCustIDNum PIC 9(5).
       02 WSCustName.
           03 WSFirstName PIC X(15).
           03 WSLastName PIC X(15).

PROCEDURE DIVISION.
*> Adding a row to an existing file 
OPEN EXTEND CustomerFile.
       DISPLAY "Customer ID Number : " WITH NO ADVANCING
       ACCEPT IDNum
       DISPLAY "Customer First Name : " WITH NO ADVANCING
       ACCEPT FirstName
       DISPLAY "Customer Last Name : " WITH NO ADVANCING
       ACCEPT LastName
       
       WRITE CustomerData
       END-WRITE.
CLOSE CustomerFile




STOP RUN.