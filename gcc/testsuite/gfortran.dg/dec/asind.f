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
      F_OE = 52.5091181879_4
      D_OE = 52.5091181879_8
      !Q_OE = 52.5091181879_16

      ! Actual
      F_OA =  ASIND (F_I)
      F_OC =  ASIND (0.79345021_4)
      D_OA = DASIND (D_I)
      D_OC = DASIND (0.79345021_8)
      !Q_OA = QASIND (Q_I)
      !Q_OC = QASIND (0.79345021_16)

      include 'check.inc'

      END PROGRAM MAIN
