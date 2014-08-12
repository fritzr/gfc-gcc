! { dg-do run }
! { dg-options "-fdec-structure" }
!
! teststructs.inc contains declarations for types T1 and T2, which are
! equivalent but with different member names (so not equal)

SUBROUTINE COMPARE (A, B)
include 'teststructs.inc'

RECORD /T1/ A
RECORD /T1/ B

if ( A.I .eq. B.I ) then
  PRINT *, "(cmp) pass"
else
  PRINT *, "FAIL!!!!"
  call abort
endif
END SUBROUTINE


PROGRAM MAIN
include 'teststructs.inc'

RECORD /T1/ X
RECORD /T2/ Y

X.IT1 = 200
X.I = 100
Y.J = 100

CALL COMPARE (X, X)
!CALL COMPARE (X, Y) ! should complain (?)

END PROGRAM
