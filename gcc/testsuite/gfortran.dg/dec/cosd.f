      ! { dg-do run }
      ! { dg-options "-fdec-math" }
      !
      include 'eqt.inc'
      include 'checkf.inc'

      PROGRAM MAIN
      include 'decl.inc'

      ! Input
      F_I = 60.0_4
      D_I = 60.0_8
      !Q_I = 60.0_16

      ! Expected
      F_OE = 0.5_4
      D_OE = 0.5_8
      !Q_OE = 0.5_16

      ! Actual
      F_OA =  COSD (F_I)
      F_OC =  COSD (60.0_4)
      D_OA = DCOSD (D_I)
      D_OC = DCOSD (60.0_8)
      !Q_OA = QCOSD (Q_I)
      !Q_OC = QCOSD (60.0_16)

      include 'check.inc'

      END PROGRAM MAIN
