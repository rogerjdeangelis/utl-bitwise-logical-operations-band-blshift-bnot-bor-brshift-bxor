Bitwise logical operations band blshift bnot bor brshift bxor

Underused functionality

 Two arguments

   1. BAND     returns the bitwise logical AND of two arguments
   2. BOR      returns the bitwise logical OR of two arguments
   3. BXOR     returns the bitwise logical EXCLUSIVE OR of two arguments

 One argument

   4. BNOT     returns the bitwise logical NOT of an argument
   5. BLSHIFT  performs a bitwise logical left shift of an argument by a specified amount
   6. BRSHIFT  performs a bitwise logical right shift of an argument by a specified amount


see
https://tinyurl.com/ybhmfyfa
https://github.com/rogerjdeangelis/utl-bitwise-logical-operations-band-blshift-bnot-bor-brshift-bxor


INPUT
=====

* INPUT DATA;
data have ;
 format arg1 arg2 binary3.;
 retain arg1 7 ;
 do arg2=0 to 7;
   output;
 end;
run;quit;

HAVE total obs=8

  ARG1    ARG2

  111     000
  111     001
  111     010
  111     011
  111     100
  111     101
  111     110
  111     111


PROCESS and OUTPUT
==================

1. BAND     returns the bitwise logical AND of two arguments
------------------------------------------------------------

   data want ;
     format arg1 arg2 result binary3.;
     set have;
     result=band(arg1, arg2);
   run;quit;

   WORK.WANT total obs=7     RULES

    ARG1    ARG2    RESULT   Corresponding Bits=1

     111     000      000
     111     001      001
     111     010      010
     111     011      011
     111     100      100
     111     101      101
     111     110      110


2. BOR      returns the bitwise logical OR of two arguments
-----------------------------------------------------------

   data want ;
     format arg1 arg2 result binary3.;
     set have;
     result=bor(arg1, arg2);
   run;quit;

   40 obs WORK.WANT total obs=7

    ARG1    ARG2    RESULT     Corresponding Bit1 or Bit2 = 1

     111     000      111
     111     001      111
     111     010      111
     111     011      111
     111     100      111
     111     101      111
     111     110      111


3. BXOR     returns the bitwise logical EXCLUSIVE OR of two arguments
---------------------------------------------------------------------

   data want;
     format arg1 arg2 result binary3.;
     set have;
     result=bxor(arg1, arg2);
   run;quit;

    40 obs WORK.WANT total obs=7

     ARG1    ARG2    RESULT   Exclusively 1 in arg1

      111     000      111
      111     001      110
      111     010      101
      111     011      100
      111     100      011
      111     101      010
      111     110      001

4. BNOT     returns the bitwise logical NOT of an argument
-----------------------------------------------------------

   data want ;
     format arg2 result binary3.;
     set have;
     result=bnot( arg2);
     drop arg1;
   run;quit;

   ARG2    RESULT   Ones complement of Arg2 (flip bits)

    000      111
    001      110
    010      101
    011      100
    100      011
    101      010
    110      001


5. BLSHIFT  performs a bitwise logical left shift of an argument by a specified amount
--------------------------------------------------------------------------------------

   data want ;
     format arg2 result binary4.;
     set have;
     result=blshift(arg2,1);
     drop arg1;
   run;quit;

   ARG2    Result - Shift bits left 1 shift (like multiplying by 2)

    000    0000
    001    0010
    010    0100
    011    0110
    100    1000
    101    1010
    110    1100
    111    1110

6. BRSHIFT  performs a bitwise logical right shift of an argument by a specified amount
---------------------------------------------------------------------------------------

   data want ;
     format arg2 result binary3.;
     set have;
     result=brshift(arg2,1);
     drop arg1;
   run;quit;


   ARG2   RESULT

    000     000
    001     000
    010     001
    011     001
    100     010
    101     010
    110     011
    111     011



