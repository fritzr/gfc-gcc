      IMPLICIT NONE

      LOGICAL f_eqt, d_eqt!, q_eqt
      LOGICAL BF, CF, DF, BD, CD, DD
      CHARACTER*12 E, A

      ! I  input
      ! O  output
      ! E  expected
      ! A  actual
      ! C  constant expression
      ! X  variable op expression
      ! -  regular expression
      REAL*4  xf, F_I, F_OE, F_OXE, F_OA, F_OC, F_OX, F_TOL
      REAL*8  xd, D_I, D_OE, D_OXE, D_OA, D_OC, D_OX, D_TOL
      !REAL*16 Q_I, Q_OE, Q_OA, Q_OC, Q_TOL

      F_TOL = 5e-6_4
      D_TOL = 5e-6_8
      !Q_TOL = 5e-6_16
