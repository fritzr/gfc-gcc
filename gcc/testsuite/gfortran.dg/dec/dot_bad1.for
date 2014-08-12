! { dg-do compile }
! { dg-options "-fdec-member-dot" }
!
! This should NOT compile with -fdec-member-dot.
! This tests the precedence between member accesses and intrinsic
! operators.
!
! Since the member 'eq' is not a derived type variable, the compiler
! should attempt to use the intrinsic operator 'eq', even though it is
! not applicable to t2.
program main
type T1_t
    integer :: i
end type T1_t
type T2_t
    integer :: i
    integer :: eq
end type T2_t
 
type(T2_t) :: t2
integer :: i
t2%eq = 1
t2%i = 2
i = 4
print *,  t2.eq.i    ! { dg-error "Operands of comparison" }
print *, (t2).eq.i   ! { dg-error "Operands of comparison" }

end program
