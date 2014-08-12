! { dg-do compile }
! { dg-options "-ffree-form" }
!
! Test error checking for variable name which conflicts type name.
!
program main
type ty
  integer i
end type
type (TY) ty ! { dg-error "Declaration of 'ty' at (1) conflicts" }
end program
