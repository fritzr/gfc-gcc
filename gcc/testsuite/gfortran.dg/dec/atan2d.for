      ! { dg-do run }
      ! { dg-options "-fdec-math" }
      !
      include 'eqt.inc'
      include 'checkf.inc'

      PROGRAM MAIN
      IMPLICIT NONE

      LOGICAL f_eqt, d_eqt!, q_eqt
      LOGICAL BF, CF, BD, CD!, BQ, CQ
      CHARACTER*12 E, A

      ! in,   out expected,   out actual,   out from constant input
      REAL*4  F_I1, F_I2, F_OE, F_OA, F_OC, F_TOL
      REAL*8  D_I1, D_I2, D_OE, D_OA, D_OC, D_TOL
      !REAL*16 Q_I1, Q_I2, Q_OE, Q_OA, Q_OC, Q_TOL

      F_TOL = 5e-5_4
      D_TOL = 5e-6_8
      !Q_TOL = 5e-6_16

      ! Input
      F_I1 = 2.679676_4
      F_I2 = 1.0_4
      D_I1 = 2.679676_8
      D_I2 = 1.0_8
      !Q_I1 = 2.679676_16
      !Q_I2 = 1.0_16

      ! Expected
      F_OE = 69.53546_4
      D_OE = 69.53546_8
      !Q_OE = 69.53546_16

      ! Actual
      F_OA =  ATAN2D (F_I1, F_I2)
      F_OC =  ATAN2D (2.679676_4, 1.0_4)
      D_OA = DATAN2D (D_I1, D_I2)
      D_OC = DATAN2D (2.679676_8, 1.0_8)
      !Q_OA = QATAN2D (Q_I1, Q_I2)
      !Q_OC = QATAN2D (2.679676_16, 1.0_16)

      include 'check.inc'

      END PROGRAM MAIN
