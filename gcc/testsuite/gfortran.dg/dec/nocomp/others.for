      ! { dg-do compile }
      ! { dg-options "-fdec-intrinsic-ints" }
      !
      ! Tests the extended integer formats on bitwise and other
      ! functions (BIJK-prefixes).
      ! The functions in this test may not be implemented.
      !

      PROGRAM MAIN

      INTEGER*1 :: BA, BB, BC, BD
      INTEGER*2 :: IA, IB, IC, ID
      INTEGER*4 :: JA, JB, JC, JD
      INTEGER*8 :: KA, KB, KC, KD

      BA = BIBITS(357, 10, 5)
      BB = BMVBITS(357, 8, 3, BA, 1)
      BC = BISHFTC(BA, 6, 3)
      BD = BISHFT(BC, -3)
      BA = BNOT(BD)

      IA = IIBITS(357, 10, 5)
      IB = IMVBITS(357, 8, 3, IA, 1)
      IC = IISHFTC(IA, 3, 6)
      ID = IISHFT(IC, -3)
      IA = INOT(ID)

      JA = JIBITS(357, 10, 5)
      JB = JMVBITS(357, 8, 3, JA, 1)
      JC = JISHFTC(JA, 3, 6)
      JD = JISHFT(JC, -3)
      JA = JNOT(JD)

      KA = KIBITS(357_8, 10_8, 5_8)
      KB = KMVBITS(357_8, 8_8, 3_8, KA, 1_8)
      KC = KISHFTC(KA, 3_8, 6_8)
      KD = KISHFT(KC, -3_8)
      KA = KNOT(KD)

      END PROGRAM
