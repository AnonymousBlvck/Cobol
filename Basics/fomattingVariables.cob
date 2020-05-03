       >>SOURCE FORMAT FREE
*> Edit Data
IDENTIFICATION DIVISION.
PROGRAM-ID. coboltut6.
AUTHOR. NANDO BINGANI .
DATE-WRITTEN.April 28.
 
ENVIRONMENT DIVISION.

DATA DIVISION.
FILE SECTION.
WORKING-STORAGE SECTION.
01 StartNum PIC 9(8)V99 VALUE 00001123.55.
01 NoZero PIC ZZZZZZZ9.99.
01 NoZPlusC PIC ZZ,ZZZ,ZZ9.99.
01 Dollar PIC $$,$$$,$$9.99.
01 BDay PIC 9(8) VALUE 12211974.
01 ADate PIC 99/99/9999.

PROCEDURE DIVISION.
MOVE StartNum TO NoZero
DISPLAY NoZero
MOVE StartNum TO NoZPlusC
DISPLAY NoZPlusC
MOVE StartNum TO Dollar
DISPLAY Dollar
MOVE BDay TO ADate
DISPLAY ADate

STOP RUN.