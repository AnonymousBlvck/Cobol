       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. coboltut.
AUTHOR. NANDO BINGANI .
DATE-WRITTEN.April 28.
 
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SPECIAL-NAMES.
       CLASS PassingScore IS "A" THRU "D".

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 Age PIC 99 VALUE 0.
01 Grade PIC 99 VALUE 0.
01 Score PIC X(1) VALUE "B".
01 CanVoteFlag PIC 9 VALUE 0.
       88 CanVote VALUE 1.
       88 CantVote Value 0.
01 TestNumber PIC X.
       88 IsPrime VALUE "1","2","3","5","7".
       88 IsEven VALUE "2","4","6","8".
       88 IsOdd VALUE "1","2","3","5","7","9".
       88 IsLessThan5 VALUE "1"THRU "4".
       88 ANumber VALUE "1" THRU "9".

PROCEDURE DIVISION.

       DISPLAY "Enter age : " WITH NO ADVANCING.
       ACCEPT Age.
       DISPLAY Age.
       IF Age > 18 THEN 
           DISPLAY "You can vote"
       ELSE 
           DISPLAY "You can not vote"
       END-IF.

       IF Age < 5 THEN 
           DISPLAY "STAY HOME"
       END-IF.

       IF Age>5 AND Age<18 THEN    
           COMPUTE Grade=Age - 5
           DISPLAY "Go to grade " Grade
       END-IF.
       
       IF Age >= 18 THEN 
           DISPLAY "Go to collage " 
       END-IF.

       *> CLASSIFICATION INSIDE A LIST
       IF Score IS PassingScore THEN
           DISPLAY "You Passed"
       ELSE 
           DISPLAY "You Failed"
       END-IF.

       *>BOOLEAN
       IF Age > 18 THEN 
           SET CanVote TO TRUE
       ELSE 
           SET CantVote TO TRUE
       END-IF.
       DISPLAY CanVoteFlag.
       
       DISPLAY "Enter a single number" WITH NO ADVANCING.
       ACCEPT TestNumber.

       PERFORM UNTIL NOT ANumber
           EVALUATE TRUE 
               WHEN IsEven DISPLAY " Even"
               WHEN IsOdd DISPLAY " Odd"
               WHEN IsLessThan5 DISPLAY " Less than 5"
               WHEN IsANumber DISPLAY " A number"
               WHEN OTHER DISPLAY 'DEFAULT '
           END-EVALUATE
           ACCEPT TestNumber
       END-PERFORM.

       Sub1.
       DISPLAY "Paragraph 1"
       PERFORM Sub2.
       DISPLAY "End of paragraph 1"
       STOP RUN.

Sub2.
       DISPLAY "Paragraph 2"

STOP RUN.