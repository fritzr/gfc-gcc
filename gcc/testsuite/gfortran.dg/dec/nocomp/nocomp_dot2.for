! { dg-do compile }
! { dg-options "-fdec-member-dot }
!
! This is a horrible example of how twisted Fortran is:
! "X.AND.AND.AND.AND" resolves to (X.AND.AND) .AND. (AND)
! because ".AND." is defined to take (LOGICAL, T) parameters 
! where "X.AND.AND" is type LOGICAL and "AND" is type T.
! Without the knowledge of the type of parameters expected by the
! user-defined ".AND.", this would be completely ambiguous.
module mod

TYPE t2
    logical and
END TYPE

TYPE t
    TYPE(t2) and
END TYPE
  
interface operator (.and.)
    module procedure a
end interface operator (.and.)

contains

function a(x, y)
    type(t), intent (in) :: y
    logical, intent (in) :: x
    logical a
    print *, "called and"
    a = (.not. x) .and. (.not. y%and%and)
    return
end function a

end module mod

use mod

TYPE(t) :: and
!and%and%and = .true.

and.and.and = and.and.and.and.and

if ( and.and.and ) then ! (x->and) .AND. (z)
    print *, .true.
endif

end program
