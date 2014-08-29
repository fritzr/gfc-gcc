! { dg-do run }
! { dg-options "-fno-automatic -finit-local-zero" }
!
! Make sure variables are saved with -fno-automatic except in
! functions marked RECURSIVE, and that they are still initialized with
! -finit-local-zero.
!

function f (x)
implicit none
  integer f, x
  integer a ! should be SAVEd
  a = a + x ! should increment by y every time
  f = a
  return
endfunction

recursive function g (x)
implicit none
  integer g, x
  integer b ! should be automatic
  b = b + x ! should be set to y every time
  g = b
  return
endfunction

implicit none
integer f, g

! Should return static value of a; accumulates y
if ( f(3) .ne. 3 ) then
  call abort ()
endif
if ( f(4) .ne. 7 ) then
  call abort ()
endif
if ( f(2) .ne. 9 ) then
  call abort ()
endif

! Should return automatic value of a; equal to y each time
if ( g(3) .ne. 3 ) then
  call abort ()
endif
if ( g(4) .ne. 4 ) then
  call abort ()
endif
if ( g(2) .ne. 2 ) then
  call abort ()
endif

end
