! { dg-do compile }
! { dg-options "-Wargtype-mismatch" }
!
! Warn when %val()/%loc() cause type mismatches in arguments
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
call printt (%loc(y)) ! { dg-warning "Type mismatch in argument" }
call printt (%val(i)) ! { dg-warning "Type mismatch in argument" }

end

