! { dg-do run }
! { dg-options "-fdec-member-dot" }
!
! This should compile with -fdec-member-dot.
!
! Tests whether integer literals as operands inhibit recognizing '.' as
! a member separator. 
!
! Output should be "pass".
PROGRAM MAIN
TYPE t
    INTEGER :: i
    INTEGER :: j
END TYPE

INTEGER :: tmp1 = 0
INTEGER :: tmp2 = 1
TYPE (t) tmp3
tmp3.i = 0
tmp3.j = 1

if     ( .not. (tmp1.eq.0)   ) then
    print *, "FAIL!!!! 0"
    call abort

elseif ( .not. (1.eq.tmp2)   ) then
    print *, "FAIL!!!! 1"
    call abort

elseif ( .not. (tmp3.i.eq.0) ) then
    print *, "FAIL!!!! ->0"
    call abort

elseif ( .not. (1.eq.tmp3.j) ) then
    print *, "FAIL!!!! ->1"
    call abort

endif

END PROGRAM MAIN
