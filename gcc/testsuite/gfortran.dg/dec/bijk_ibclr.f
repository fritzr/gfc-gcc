      ! { dg-do compile }
      ! { dg-options "-fdec-intrinsic-ints" }
      !
      ! Tests the extended integer formats on bitwise and other
      ! functions (BIJK-prefixes).
      !

      PROGRAM MAIN
      IMPLICIT NONE

      INTEGER*1 :: IB = 9_1, BPOS = 3_1, CB
      INTEGER*2 :: II = 9_2, IPOS = 3_2, CI
      INTEGER*4 :: IJ = 9_4, JPOS = 3_4, CJ
      INTEGER*8 :: IK = 9_8, KPOS = 3_8, CK
      INTEGER   :: I  = 9  ,  POS = 3  , C

      CB =  BBCLR(IB, BPOS)
      CI = IIBCLR(II, IPOS)
      CJ = JIBCLR(IJ, JPOS)
      CK = KIBCLR(IK, KPOS)
      C  =  IBCLR(I ,  POS)

      CB =  BBCLR(9_1, 3_1)
      CI = IIBCLR(9_2, 3_2)
      CJ = JIBCLR(9_4, 3_4)
      CK = KIBCLR(9_8, 3_8)
      C  =  IBCLR(I ,  POS)

      END PROGRAM
