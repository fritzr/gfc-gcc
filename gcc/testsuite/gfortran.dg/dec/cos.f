      ! { dg-do run }
      ! { dg-options "-fdec-math" }
      !
      include 'eqt.inc'
      include 'checkf.inc'

      PROGRAM MAIN
      include 'decl.inc'

      ! Input
      F_I = 1.0471975512_4
      D_I = 1.0471975512_8
      !Q_I = 1.0471975512_16

      ! Expected
      F_OE = 0.5_4
      D_OE = 0.5_8
      !Q_OE = 0.5_16

      ! Actual
      F_OA =  COS (F_I)
      F_OC =  COS (1.0471975512_4)
      D_OA = DCOS (D_I)
      D_OC = DCOS (1.0471975512_8)
      !Q_OA = QCOS (Q_I)
      !Q_OC = QCOS (1.0471975512_16)

      include 'check.inc'

      END PROGRAM MAIN
