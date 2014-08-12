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

      CB = BIAND(AB, BB)
      CI = IIAND(AI, BI)
      CJ = JIAND(AJ, BJ)
      CK = KIAND(AK, BK)
      C  =  IAND(A , B )

      CB = BIAND(9_1, 3_1)
      CI = IIAND(9_2, 3_2)
      CJ = JIAND(9_4, 3_4)
      CK = KIAND(9_8, 3_8)
      C  =  IAND(9  , 3  )

      END PROGRAM
