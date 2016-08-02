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
      F_OE = 0.866025403784_4
      F_OXE = xf*0.866025403784_4
      D_OE = 0.866025403784_8
      D_OXE = xd*0.866025403784_8
      !Q_OE = 0.866025403784_16

      ! Actual
      F_OA =  SIND (F_I)
      F_OC =  SIND (60.0_4)
      F_OX = xf* SIND (F_I)
      D_OA = DSIND (D_I)
      D_OC = DSIND (60.0_8)
      D_OX = xd*DSIND (D_I)
      !Q_OA = QSIND (Q_I)
      !Q_OC = QSIND (60.0_16)

      include 'check.inc'

      END PROGRAM MAIN
