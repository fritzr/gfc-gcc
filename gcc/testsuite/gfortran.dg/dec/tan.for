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
      F_OE = 1.73205080757_4
      D_OE = 1.73205080757_8
      !Q_OE = 1.73205080757_16

      ! Actual
      F_OA =  TAN (F_I)
      F_OC =  TAN (1.0471975512_4)
      D_OA = DTAN (D_I)
      D_OC = DTAN (1.0471975512_8)
      !Q_OA = QTAN (Q_I)
      !Q_OC = QTAN (1.0471975512_16)

      include 'check.inc'

      END PROGRAM MAIN
