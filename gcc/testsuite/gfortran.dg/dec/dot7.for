! { dg-do run }
! { dg-options "-fdec-member-dot" }
!
! This should compile with and without -fdec-member-dot.
! This tests the precedence between member accesses and intrinsic
! operators.
!
! This is similar to dot-3, but the member 'eq' is not a derived type
! variable so t2.eq.* should always evaluate to the operation eq(t2,*).
!
! The output should be:
! 5
! 5

include 'assert.inc'
module mod
type T1_t
    integer :: i
end type T1_t
type T2_t
    integer :: i
    integer :: eq
end type T2_t
 
interface operator (.eq.)
    module procedure eq_func
end interface operator (.eq.)

contains

function eq_func(t2, i)
    type(T2_t), intent (in) :: t2
    integer, intent (in) :: i
    integer eq_func
    eq_func = t2%eq + i
    return
end function eq_func

end module mod

use mod

type(T2_t) :: t2
integer :: i
t2%eq = 1
t2%i = 2
i = 4

call assertll ("t2.eq.i",    t2 .eq.i, 5) ! eq_func(t2,i) = 5
call assertll ("(t2).eq.i", (t2).eq.i, 5) ! eq_func(t2,i) = 5

end program
