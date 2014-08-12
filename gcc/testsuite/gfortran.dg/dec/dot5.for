! { dg-do run }
! { dg-options "-fdec-member-dot" }
!
! This should compile with -fdec-member-dot.
! This tests the precedence between member accesses and intrinsic
! operators.
!
! This is similar to dot-3, but t2 has no member 'eq' so t2.eq.i
! should always be interpreted as eq(t2,i).
include 'assert.inc'
module mod
 type T2_t
     integer :: i
 end type T2_t
  
 interface operator (.eq.)
     module procedure eq_func
 end interface operator (.eq.)

 contains

 function eq_func(t2, i) result (rslt)
     type(T2_t), intent (in) :: t2
     integer, intent (in) :: i
     rslt = t2%i + i
 end function eq_func

 end module mod

 use mod

 type(T2_t) :: t2
 integer :: i,j
 i = 0
 t2%i = -10
 j = t2.eq.i    ! eq_func(t2, i)
 call assertll ("t2.eq.i", j, -10)
 j = (t2).eq.i  ! eq_func(t2, i)
 call assertll ("(t2).eq.i", j, -10)

 end program
