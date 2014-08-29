      ! { dg-do run }
      ! { dg-options "-fdec-math" }
      !
      include 'eqt.inc'
      include 'checkf.inc'

      PROGRAM MAIN
      include 'decl.inc'

      ! Input
      F_I = 0.6_4
      D_I = 0.6_8
      !Q_I = 0.6_16

      ! Expected
      F_OE = 1.46169594708_4
      D_OE = 1.46169594708_8
      !Q_OE = 1.46169594708_16

      ! Actual
      F_OA =  COTAN (F_I)
      F_OC =  COTAN (0.6_4)
      D_OA = DCOTAN (D_I)
      D_OC = DCOTAN (0.6_8)
      !Q_OA = QCOTAN (Q_I)
      !Q_OC = QCOTAN (0.6_16)

      include 'check.inc'

      END PROGRAM MAIN
