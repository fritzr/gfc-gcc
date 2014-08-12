      ! { dg-do compile }
      ! { dg-options "-fdec-intrinsic-ints" }
      !
      ! Tests the extended integer formats on bitwise and other
      ! functions (BIJK-prefixes).
      !

      PROGRAM MAIN
      IMPLICIT NONE

      INTEGER*2 :: AI = 9_2
      INTEGER*4 :: AJ = 9_4
      INTEGER*8 :: AK = 9_8
      INTEGER   :: A  = 9

      REAL :: R

      R = FLOATI(AI)
      R = FLOATJ(AJ)
      R = FLOATK(AK)
      R = FLOAT (A )

      R = FLOATI(9_2)
      R = FLOATJ(9_4)
      R = FLOATK(9_8)
      R = FLOAT (9  )

      END PROGRAM
