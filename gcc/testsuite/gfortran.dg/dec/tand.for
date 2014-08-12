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
      F_OE = 1.73205080757_4
      D_OE = 1.73205080757_8
      !Q_OE = 1.73205080757_16

      ! Actual
      F_OA =  TAND (F_I)
      F_OC =  TAND (60.0_4)
      D_OA = DTAND (D_I)
      D_OC = DTAND (60.0_8)
      !Q_OA = QTAND (Q_I)
      !Q_OC = QTAND (60.0_16)

      include 'check.inc'

      END PROGRAM MAIN
