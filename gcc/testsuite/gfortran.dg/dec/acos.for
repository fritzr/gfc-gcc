      ! { dg-do compile }
      ! { dg-options "-fdec-structure" }
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
      F_OE = 0.822595489748_4
      D_OE = 0.822595489748_8
      !Q_OE = 0.822595489748_16

      ! Actual
      F_OA =  ACOS (F_I)
      F_OC =  ACOS (0.68032123_4)
      D_OA = DACOS (D_I)
      D_OC = DACOS (0.68032123_8)
      !Q_OA = QACOS (Q_I)
      !Q_OC = QACOS (0.68032123_16)

      include 'check.inc'

      END PROGRAM MAIN
