! { dg-do compile }
!
! This test should NOT compile with or without -fdec-member-dot.
! This tests the error message given for member accesses on valid
! derived-type variables to a missing/invalid member.
program main

type t
    integer y
end type

type (t) x
integer i,j,k,l

i = x%y
j = x%z ! { dg-error "is not a member of" }

end program
