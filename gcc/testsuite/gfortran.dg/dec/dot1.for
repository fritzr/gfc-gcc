! { dg-do compile }
! { dg-options "-fdec-member-dot" }
!
! This should compile with -fdec-member-dot.
! This tests to make sure operators beginning with '.' are not interpreted
! as structure member accesses.
!
! No output expected here.
  program main

  LOGICAL x, y, z
  x = .TRUE.
  y = .FALSE.
  z = .FALSE.

  if ( x .AND. y .OR. z ) then
  endif

  end program
