      IMPLICIT NONE

      LOGICAL f_eqt, d_eqt!, q_eqt
      LOGICAL BF, CF, BD, CD!, BQ, CQ
      CHARACTER*12 E, A

      ! in,   out expected,   out actual,   out from constant input
      REAL*4  F_I, F_OE, F_OA, F_OC, F_TOL
      REAL*8  D_I, D_OE, D_OA, D_OC, D_TOL
      !REAL*16 Q_I, Q_OE, Q_OA, Q_OC, Q_TOL

      F_TOL = 5e-6_4
      D_TOL = 5e-6_8
      !Q_TOL = 5e-6_16
