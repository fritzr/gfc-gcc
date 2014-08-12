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

      CB =  BBSET(IB, BPOS)
      CI = IIBSET(II, IPOS)
      CJ = JIBSET(IJ, JPOS)
      CK = KIBSET(IK, KPOS)
      C  =  IBSET(I ,  POS)

      CB =  BBSET(9_1, 3_1)
      CI = IIBSET(9_2, 3_2)
      CJ = JIBSET(9_4, 3_4)
      CK = KIBSET(9_8, 3_8)
      C  =  IBSET(I ,  POS)

      END PROGRAM
