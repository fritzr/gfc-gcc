! { dg-do compile }
! { dg-options "-fdec-structure" }
!
! Test error handling for %FILL
!
program main

structure /s/
  integer*2 i /3/
  integer*2 %fill /4/ ! { dg-error "Unnamed fields may not have initializers" }
  integer*2, pointer :: %fill ! { dg-error "Unnamed field at (1) may not have attributes" }
end structure

type t
  integer %fill ! { dg-error "Unnamed field at (1) only allowed in a STRUCTURE block" }
endtype

end program
