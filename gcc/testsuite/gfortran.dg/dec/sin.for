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
      F_OE = 0.866025403784_4
      D_OE = 0.866025403784_8
      !Q_OE = 0.866025403784_16

      ! Actual
      F_OA =  SIN (F_I)
      F_OC =  SIN (1.0471975512_4)
      D_OA = DSIN (D_I)
      D_OC = DSIN (1.0471975512_8)
      !Q_OA = QSIN (Q_I)
      !Q_OC = QSIN (1.0471975512_16)

      include 'check.inc'

      END PROGRAM MAIN
