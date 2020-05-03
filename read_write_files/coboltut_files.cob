       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. coboltut.
AUTHOR. NANDO BINGANI .
DATE-WRITTEN.April 28.
 
ENVIRONMENT DIVISION.
*> CONNECT THE FILE I WANT TO USE TO THE PROGRAMME
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       SELECT CustomerFile ASSIGN TO "customer.dat"
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS IS SEQUENTIAL.
           
DATA DIVISION.
FILE SECTION.
*> Describe the data that is going to be in the file.
FD CustomerFile. *>File description (Describes the file layout)
01 CustomerData.
       02  IDNum PIC 9(2).
       02  CustName.
           03 FirstName PIC X(15).
           03 LastName PIC X(15).

WORKING-STORAGE SECTION.
*> this section here will allow us to read data from the database.
01 WSCustomer.
       02  WSIDNum PIC 9(2).
       02  WSCustName.
           03 WSFirstName PIC X(10).
           03 WSLastName PIC X(10).
01 WSEOF PIC A(1).
PROCEDURE DIVISION.
*> OUTPUT Writes to one line (Inserts one record)
*> EXTEND Writes to a new line 
*>OPEN EXTEND CustomerFile
       *> DISPLAY "Enter Customer ID 2 digits :" WITH NO ADVANCING
       *> ACCEPT IDNum
       *> DISPLAY "Enter First Name :" WITH NO ADVANCING
       *> ACCEPT FirstName
       *> DISPLAY "Enter LastName :" WITH NO ADVANCING
       *> ACCEPT LastName
       *> WRITE CustomerData
       *> END-WRITE.
*>CLOSE CustomerFile.

*> INPUT allows us to read file
OPEN INPUT CustomerFile
       PERFORM UNTIL WSEOF ="Y"
           READ CustomerFile INTO WSCustomer
           AT END MOVE "Y" TO WSEOF
           NOT AT END DISPLAY WSCustomer
           END-READ
       END-PERFORM
       
CLOSE CustomerFile.



STOP RUN.