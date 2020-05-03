       >>SOURCE FORMAT FREE
IDENTIFICATION DIVISION.
PROGRAM-ID. coboltut.
AUTHOR. NANDO BINGANI .
DATE-WRITTEN.April 28.
 
ENVIRONMENT DIVISION.

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 SampStr     PIC X(18) VALUE 'eerie beef sneezed'.
01 NumChars    PIC 99 VALUE 0.
01 NumEs       PIC 99 VALUE 0.
01 FName       PIC X(6) VALUE 'Martin'.
01 MName       PIC X(11) VALUE 'Luther King'.
01 LName       PIC X(4) VALUE 'King'.
01 FLName      PIC X(11).
01 FMLName     PIC X(18).
01 SStr1       PIC X(7) VALUE "The egg".
01 SStr2       PIC X(9) VALUE "is #1 and".
01 Dest        PIC X(33) VALUE "is the big chicken". 
01 Ptr         PIC 9 VALUE 1.
01 SStr3       PIC X(3).
01 SStr4       PIC X(3).

PROCEDURE DIVISION.
*>Count number of E's
INSPECT SampStr TALLYING NumEs FOR ALL  'e'.
DISPLAY "Number of e's : " NumEs.
*> UpperCase 
Display function upper-case(SampStr).

*> Concatinate strings
string FName delimited by size
       space
       LName delimited by size
       into FLName
end-string
display FName

STRING SStr1 DELIMITED BY SIZE
       SPACE
       SStr2 DELIMITED BY "#"
       INTO Dest
       WITH POINTER Ptr
END-STRING
display Dest.

*> Unstring
unstring SStr1 delimited by space
into  SStr3, SStr4
end-unstring

display SStr3 " - " SStr4




  

STOP RUN.