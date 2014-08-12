! { dg-do compile }
! { dg-options "-fcray-pointer" }
!
! Allow assumed-size arrays which are derived-type Cray pointees.
!
program main

type test
  integer*4 i
end type

type (test) y(*)
pointer (y_ptr, y)

end program
