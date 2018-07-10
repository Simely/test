       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO-WORLD.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-RANDOMS.
          05 Usdsd                         PIC 9(3) VALUE 000.
          05 D                         PIC 9(3) VALUE 000.
          05 A                         PIC 9(2) VALUE 00.
          05 WS-COMP                   PIC 9(20).
          05 WS-RANDOM                 PIC V9(02).

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.

       01 WS-SUBAREA                   PIC X(12).
       01 WS-CALLNO                    COMP S9(4).
       01 WS-TITLE                     PIC X(30).
       01 WS-SQLCODE                   COMP S9(4).

       EXEC SQL END DECLARE SECTION END-EXEC.

       PROCEDURE DIVISION.
        MAIN SECTION.
          DISPLAY 'ENTER SOMETHING TO SEED RNG'
          ACCEPT WS-COMP
          COMPUTE WS-RANDOM = FUNCTION RANDOM (WS-COMP).
          DISPLAY WS-RANDOM.

          PERFORM VARYING A FROM 1 BY 1 UNTIL A >= 90
            COMPUTE WS-RANDOM = FUNCTION RANDOM
            DISPLAY WS-RANDOM
            IF WS-RANDOM = 0 OR 1
              ADD WS-RANDOM TO U
            ELSE IF WS-RANDOM = 2 OR 3
              ADD WS-RANDOM TO D
          END-PERFORM.
          DISPLAY U
          DISPLAY D
          STOP RUN.
