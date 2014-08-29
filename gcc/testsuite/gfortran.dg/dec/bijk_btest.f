      ! { dg-do compile }
      ! { dg-options "-fdec-intrinsic-ints" }
      !
      ! Tests the extended integer formats on bitwise and other
      ! functions (BIJK-prefixes).
      !

      PROGRAM MAIN
      IMPLICIT NONE

      INTEGER*1 :: IB = 9_1, BPOS = 3_1
      INTEGER*2 :: II = 9_2, IPOS = 3_2
      INTEGER*4 :: IJ = 9_4, JPOS = 3_4
      INTEGER*8 :: IK = 9_8, KPOS = 3_8
      INTEGER   :: I  = 9  ,  POS = 3

      LOGICAL*1 :: LB
      LOGICAL*2 :: LI
      LOGICAL*4 :: LJ
      LOGICAL*8 :: LK
      LOGICAL   :: L

      LB = BBTEST(IB, BPOS)
      LI = BITEST(II, IPOS)
      LJ = BJTEST(IJ, JPOS)
      LK = BKTEST(IK, KPOS)
      L  =  BTEST(I ,  POS)

      LB = BBTEST(9_1, 3_1)
      LI = BITEST(9_2, 3_2)
      LJ = BJTEST(9_4, 3_4)
      LK = BKTEST(9_8, 3_8)
      L  =  BTEST(9  , 3  )

      END PROGRAM
