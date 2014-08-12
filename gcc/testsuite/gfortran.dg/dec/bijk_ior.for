      ! { dg-do compile }
      ! { dg-options "-fdec-intrinsic-ints" }
      !
      ! Tests the extended integer formats on bitwise and other
      ! functions (BIJK-prefixes).
      !

      PROGRAM MAIN
      IMPLICIT NONE

      INTEGER*1 :: AB = 9_1, BB = 3_1, CB
      INTEGER*2 :: AI = 9_2, BI = 3_2, CI
      INTEGER*4 :: AJ = 9_4, BJ = 3_4, CJ
      INTEGER*8 :: AK = 9_8, BK = 3_8, CK
      INTEGER   :: A  = 9  , B  = 3  , C

      CB = BIOR(AB, BB)
      CI = IIOR(AI, BI)
      CJ = JIOR(AJ, BJ)
      CK = KIOR(AK, BK)
      C  =  IOR(A , B )

      CB = BIOR(9_1, 3_1)
      CI = IIOR(9_2, 3_2)
      CJ = JIOR(9_4, 3_4)
      CK = KIOR(9_8, 3_8)
      C  =  IOR(9  , 3  )

      END PROGRAM
