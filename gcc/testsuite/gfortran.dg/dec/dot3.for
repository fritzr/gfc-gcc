! { dg-do run }
! { dg-options "-fdec-member-dot" }
!
! This should compile with -fdec-member-dot.
! This tests the precedence between member accesses and intrinsic
! operators.
!
! The first expression t2.eq.i should be evaluated as (t2->eq)->i
! and return 0. The second expression (t2).eq.i should be evaluated
! as the operation eq(t2,i) and call eq_func resulting in -10.
       include 'assert.inc'
       module mod
       type T1_t
           integer :: i
       end type T1_t
       type T2_t
           type (T1_t) :: eq
           integer :: i
       end type T2_t
        
       interface operator (.eq.)
           module procedure eq_func
       end interface operator (.eq.)

       contains

       function eq_func(t2, i) result (rslt)
           type(T2_t), intent (in) :: t2
           integer, intent (in) :: i
           rslt = t2%eq%i + i
       end function eq_func

       end module mod

       use mod

       type(T2_t) :: t2
       integer :: i,j
       t2%eq%i = 2
       t2%i = -10
       i = -10
       j = t2 . eq . i    ! t2->eq->i
       call assertll ("t2.eq.i", j, 2)
       j = (t2) . eq . i  ! eq_func(t2, i)
       call assertll ("(t2).eq.i", j, -8)
       
       end program
