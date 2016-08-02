      ! { dg-do run }
      ! { dg-options "-fdec-math" }
      !
      include 'eqt.inc'
      include 'checkf.inc'

      PROGRAM MAIN
      include 'decl.inc'

      ! Input
      F_I = 0.68032123_4
      D_I = 0.68032123_8
      !Q_I = 0.68032123_16

      ! Expected
      F_OE = 47.131249809_4
      F_OXE = xf*47.131249809_4
      D_OE = 47.131249809_8
      D_OXE = xd*47.131249809_8
      !Q_OE = 47.131249809_16

      ! Actual
      F_OA =  ACOSD (F_I)
      F_OC =  ACOSD (0.68032123_4)
      F_OX = xf* ACOSD (F_I)
      D_OA = DACOSD (D_I)
      D_OC = DACOSD (0.68032123_8)
      D_OX = xd*DACOSD (D_I)
      !Q_OA = QACOSD (Q_I)
      !Q_OC = QACOSD (0.68032123_16)

      include 'check.inc'

      END PROGRAM MAIN
