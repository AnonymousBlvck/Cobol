       >>SOURCE FORMAT FREE    
IDENTIFICATION DIVISION.
PROGRAM-ID. reports_programe.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
       *>File which I will be writing the report to 
       SELECT CustomerReport assign to "CustReport.rpt"
           organization line SEQUENTIAL.

       *>File which I will be reading and writing from data from 
       SELECT CustomerFile ASSIGN TO "customer.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD CustomerReport.
01 PrintLine pic x(44).

FD CustomerFile.
01 CustomerData.
       02 CustID pic 9(2).
       02 CustName.
           03 FName pic x(10).
           03 LName pic x(13).
       88 WSEOF VALUE high-value.

WORKING-STORAGE SECTION.
01 PageHeading.
       02 filler pic x(13) value "Customer List".
01 PageFooting.
       02 filler pic x(13) value spaces.
       02 filler pic x(7) value "Page : ".
       02 PrnPageNum pic z9.

01 Heads pic x(36) value "IdNum    FirstName    LastName".
01 CustomerDetailLine.
       02 filler pic  x value spaces.
       02 PrnCustID pic 9(2).
       02 filler PIC x(6) value spaces.
       02 PrnCustFName pic x(7).
       02 filler PIC  x(1) value spaces.
       02 PrnCustLName pic x(10).

01 ReportFooting pic x(20) value "END OF REPORT".
01 LineCount Pic 99 value Zero.
       88 NewpageRequired value 40 thru 99.
01 PageCount pic 99 value 0.

PROCEDURE DIVISION.
open input CustomerFile.
open output CustomerReport
       
perform PrintPageHeading 
    read CustomerFile
        at end set WSEOF to true
    end-read.
    
    perform PrintReportBody until WSEOF
        write PrintLine FROM ReportFooting after advancing 6 lines 
        
close CustomerFile,CustomerReport.
STOP RUN.

PrintPageHeading.
write PrintLine from PageHeading after advancing Page.
write PrintLine from Heads after advancing 5 lines.
move 3 to LineCount.
add 1 to PageCount.

PrintReportBody.
IF NewPageRequired
       MOVE PageCount TO PrnPageNum
       WRITE PrintLine FROM PageFooting AFTER ADVANCING 5 LINES
       PERFORM PrintPageHeading
END-IF

MOVE CustID to PrnCustID.
move FName to PrnCustFName.
move LName to PrnCustLName.

write PrintLine from CustomerDetailLine after advancing 1 line
add 1 to LineCount

read CustomerFile 
       at end set WSEOF to true
end-read.



