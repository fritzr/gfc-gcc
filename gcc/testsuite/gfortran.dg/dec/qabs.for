      ! { dg-do run }
      ! { dg-options "-fdec-math" }
      !
      PROGRAM MAIN
      IMPLICIT NONE

      REAL*16 QP, QN, QA, QAA
      QP  =  1.412572351314223e440_16
      QN  = -1.412572351314223e440_16
      QA  = QABS(QN)
      QAA = ABS(QN)

      if ( .not. QA .eq. QP  .or. .not. QAA .eq. QP ) then
          print *, "FAIL!!!!"
          print *, "QN", QN
          print *, "QP", QP
          print *, "QA", QA
          print *, "QAA", QAA
          call abort
      endif

      END PROGRAM
