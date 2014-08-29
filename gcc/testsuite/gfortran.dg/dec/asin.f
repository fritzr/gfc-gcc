      ! { dg-do run }
      ! { dg-options "-fdec-math" }
      !
      include 'eqt.inc'
      include 'checkf.inc'

      PROGRAM MAIN
      include 'decl.inc'

      ! Input
      F_I = 0.79345021_4
      D_I = 0.79345021_8
      !Q_I = 0.79345021_16

      ! Expected
      F_OE = 0.916456999698_4
      D_OE = 0.916456999698_8
      !Q_OE = 0.916456999698_16

      ! Actual
      F_OA =  ASIN (F_I)
      F_OC =  ASIN (0.79345021_4)
      D_OA = DASIN (D_I)
      D_OC = DASIN (0.79345021_8)
      !Q_OA = QASIN (Q_I)
      !Q_OC = QASIN (0.79345021_16)

      include 'check.inc'

      END PROGRAM MAIN
