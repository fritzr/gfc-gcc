! { dg-do compile }
! { dg-options "-fdec-structure" }
!
! Make sure variables can share names with structures.
!
program main

structure /TY/
  integer i
end structure
record /TY/ ty

end program
