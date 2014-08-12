      ! { dg-do compile }
      ! { dg-options "-fdec-intrinsic-ints" }
      !
      ! Tests the extended integer formats on bitwise and other
      ! functions (BIJK-prefixes).
      !

      PROGRAM MAIN
      IMPLICIT NONE

      INTEGER*1 :: AB = -9_1, BB
      INTEGER*2 :: AI = -9_2, BI
      INTEGER*4 :: AJ = -9_4, BJ
      INTEGER*8 :: AK = -9_8, BK
      INTEGER   :: A  = -9  , B

      BB =  BABS(AB)
      BI = IIABS(AI)
      BJ = JIABS(AJ)
      BK = KIABS(AK)
      B  =  IABS(A )

      BB =  BABS(9_1)
      BI = IIABS(9_2)
      BJ = JIABS(9_4)
      BK = KIABS(9_8)
      B  =  IABS(9  )

      END PROGRAM
