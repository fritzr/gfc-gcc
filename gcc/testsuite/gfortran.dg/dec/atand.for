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
      F_OE = 57.7922906336_4
      D_OE = 57.7922906336_8
      !Q_OE = 57.7922906336_16

      ! Actual
      F_OA =  ATAND (F_I)
      F_OC =  ATAND (1.5874993_4)
      D_OA = DATAND (D_I)
      D_OC = DATAND (1.5874993_8)
      !Q_OA = QATAND (Q_I)
      !Q_OC = QATAND (1.5874993_16)

      include 'check.inc'

      END PROGRAM MAIN
