      ! { dg-do run }
      ! { dg-options "-fdec-math" }
      !
      include 'eqt.inc'
      include 'checkf.inc'

      PROGRAM MAIN
      include 'decl.inc'

      ! Input
      F_I = 1.5874993_4
      D_I = 1.5874993_8
      !Q_I = 1.5874993_16

      ! Expected
      F_OE = 1.00866575383_4
      D_OE = 1.00866575383_8
      !Q_OE = 1.00866575383_16

      ! Actual
      F_OA =  ATAN (F_I)
      F_OC =  ATAN (1.5874993_4)
      D_OA = DATAN (D_I)
      D_OC = DATAN (1.5874993_8)
      !Q_OA = QATAN (Q_I)
      !Q_OC = QATAN (1.5874993_16)

      include 'check.inc'

      END PROGRAM MAIN
