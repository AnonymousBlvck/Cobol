
       >>SOURCE FORMAT FREE       
IDENTIFICATION DIVISION.
PROGRAM-ID. program_.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

       SELECT CustomerFile ASSIGN TO "customer.txt"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS RANDOM
           RECORD KEY IS CustID.

DATA DIVISION.
FILE SECTION.
FD CustomerFile.
       01 CustomerData.
              02 CustID PIC 99.
              02 CustFName PIC X(15).
              02 CustLName PIC X(15).
       
WORKING-STORAGE SECTION.
01 Choice PIC 9.
01 StayOpen PIC X value "Y".
01 CustExists PIC x.

PROCEDURE DIVISION.
StartPara.
       OPEN I-O CustomerFile.
       PERFORM UNTIL StayOpen="N"
            DISPLAY " "
            DISPLAY "Customer records"
            DISPLAY "1 : Add Customer "
            DISPLAY "2 : Delete Customer "
            DISPLAY "3 : Update Customer "
            DISPLAY "4 : Get Customer "
            DISPLAY "0 : Quit "
            DISPLAY ": " WITH NO ADVANCING
            ACCEPT Choice

            EVALUATE Choice
               WHEN 1 PERFORM AddCust
               WHEN 2 PERFORM DeleteCust
               WHEN 3 PERFORM UpdateCust
               WHEN 4 PERFORM GetCust
               WHEN OTHER MOVE "N" TO StayOpen
            END-EVALUATE
        END-PERFORM.
CLOSE CustomerFile.
STOP RUN.

AddCust.
       DISPLAY " "
       DISPLAY "Enter ID : " WITH NO ADVANCING.
       ACCEPT CustID.
       DISPLAY "Enter First Name : " WITH NO ADVANCING.
       ACCEPT CustFName.
       DISPLAY "Enter Last Name : " WITH NO ADVANCING.
       ACCEPT CustLName.
       DISPLAY " ".

       WRITE CustomerData
           INVALID KEY DISPLAY "ID taken"
       END-WRITE.

DeleteCust.
       DISPLAY " "
       DISPLAY "Enter ID to delete : " WITH NO ADVANCING
       ACCEPT CustID
       DISPLAY " "
       DELETE CustomerFile
           INVALID KEY DISPLAY "Key doesnt exist"    
       END-DELETE.

UpdateCust.
       MOVE "Y" TO CustExists.
       DISPLAY " "
       DISPLAY "Enter ID to update : " WITH NO ADVANCING
       ACCEPT CustID

       READ CustomerFile
           INVALID KEY MOVE "N" TO CustExists
       END-READ.

       IF CustExists="N"
            DISPLAY "Customer doesn't exist"
       else 
           DISPLAY "Enter the new firstname : " WITH NO ADVANCING
           ACCEPT CustFName
           DISPLAY "Enter the new lastname : " WITH NO ADVANCING
           ACCEPT CustLName
       END-IF.

       rewrite CustomerData 
           INVALID KEY  DISPLAY "Customer not updated"
       END-rewrite.

GetCust.
       MOVE "Y" TO CustExists.
       DISPLAY " ".
       DISPLAY "Enter Customer ID to find : " WITH NO ADVANCING.
       ACCEPT CustID.
       READ CustomerFile
           INVALID KEY MOVE "N" TO CustExists
       END-READ.

       IF CustExists="N"
            DISPLAY "Customer doesn't exist "
       END-IF.

       IF CustExists="Y"
           DISPLAY "ID : " CustID
           DISPLAY "First name : " CustFName
           DISPLAY "Last name : " CustLName
       END-IF.

