! { dg-do compile }
! { dg-options "-Wno-arglist-types" }
!
! Don't warn when %val()/%loc() cause type mismatches in arguments
!

subroutine printt (x)
type t
  real r
end type
type (t), intent(in) :: x
print *, x%r
end subroutine

type t
  real r
end type
type (t) y

integer :: i
i = loc(y)
call printt (%loc(y))
call printt (%val(i))

end

