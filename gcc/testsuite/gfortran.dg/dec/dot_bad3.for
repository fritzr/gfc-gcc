! { dg-do compile }
!
! This should NOT compile with or without -fdec-member-dot.
! This tests the error message given for invalid member accesses.
program main

integer i,j,k
k = i.j ! { dg-error "Unclassifiable statement" }

end program
