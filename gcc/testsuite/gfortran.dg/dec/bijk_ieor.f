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

      CB = BIEOR(AB, BB)
      CI = IIEOR(AI, BI)
      CJ = JIEOR(AJ, BJ)
      CK = KIEOR(AK, BK)
      C  =  IEOR(A , B )

      CB = BIEOR(9_1, 3_1)
      CI = IIEOR(9_2, 3_2)
      CJ = JIEOR(9_4, 3_4)
      CK = KIEOR(9_8, 3_8)
      C  =  IEOR(9  , 3  )

      END PROGRAM
