    >>SOURCE FORMAT FREE
*> Floating point arithmetic : fixed point decimal
IDENTIFICATION DIVISION.
PROGRAM-ID. coboltut7.
AUTHOR. NANDO BINGANI .
DATE-WRITTEN.April 28.
 
ENVIRONMENT DIVISION.

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION. 
01 Price Pic 9(4)V99.
01 TaxRate PIC V999 VALUE 0.075.
01 FullPrice PIC 9(4)V99.
01 NoZeros PIC ZZZ9V99.
PROCEDURE DIVISION.
DISPLAY "Enter the Price : " WITH NO ADVANCING
ACCEPT Price
COMPUTE FullPrice ROUNDED = Price + ( Price * TaxRate ) 
DISPLAY "Price + Tax : " FullPrice.

STOP RUN.