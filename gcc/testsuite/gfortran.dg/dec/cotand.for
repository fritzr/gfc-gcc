      ! { dg-do run }
      ! { dg-options "-fdec-math" }
      !
      include 'eqt.inc'
      include 'checkf.inc'

      PROGRAM MAIN
      include 'decl.inc'

      F_TOL = 5e-5_4

      ! Input
      F_I = 0.6_4
      D_I = 0.6_8
      !Q_I = 0.6_16

      ! Expected
      F_OE = 95.4894751711_4
      D_OE = 95.4894751711_8
      !Q_OE = 95.4894751711_16

      ! Actual
      F_OA =  COTAND (F_I)
      F_OC =  COTAND (0.6_4)
      D_OA = DCOTAND (D_I)
      D_OC = DCOTAND (0.6_8)
      !Q_OA = QCOTAND (Q_I)
      !Q_OC = QCOTAND (0.6_16)

      include 'check.inc'

      END PROGRAM MAIN
