      LOGICAL*4 FUNCTION f_eqt(fe, fa, t)
        IMPLICIT NONE
        REAL*4, INTENT (IN) :: fe
        REAL*4, INTENT (IN) :: fa
        REAL*4, INTENT (IN) :: t
        REAL*4 diff
        diff = ABS(fa - fe)
        f_eqt = diff .lt. t
      END

      LOGICAL*4 FUNCTION d_eqt(de, da, t)
        IMPLICIT NONE
        REAL*8, INTENT (IN) :: de
        REAL*8, INTENT (IN) :: da
        REAL*8, INTENT (IN) :: t
        REAL*8 diff
        diff = DABS(da - de)
        d_eqt = diff .lt. t
      END

      !LOGICAL*4 FUNCTION q_eqt(qe, qa, t)
      !  IMPLICIT NONE
      !  REAL*16, INTENT (IN) :: qe
      !  REAL*16, INTENT (IN) :: qa
      !  REAL*16, INTENT (IN) :: t
      !  REAL*16 diff
      !  diff = QABS(qa - qe)
      !  q_eqt = diff .lt. t
      !END
