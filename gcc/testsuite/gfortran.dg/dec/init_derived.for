! { dg-do run }
! { dg-options "-finit-local-zero -finit-derived" }
!
! Make sure -finit-derived initializes components of local derived type
! variables.
!
include 'assert.inc'

function myfunc(i)
    integer myfunc, i
    TYPE item
      INTEGER :: id ! = 0
      INTEGER :: description  = 0
      INTEGER :: noinit
      REAL price
    END TYPE

    TYPE(item) pear
    INTEGER x
    pear%noinit = 0
    if(i > 0) then
        pear%id = i
    endif
    myfunc = x + i + pear%id
end function myfunc

program main
implicit none
TYPE item
  INTEGER :: id ! = 0
  INTEGER :: description  = 0
  INTEGER :: noinit
  REAL price
END TYPE

type(item) bob
integer :: i, j, myfunc

call assertll ("i", i, 0)
call assertll ("j", j, 0)
call assertll ("bob%id", bob%id, 0)
call assertll ("bob%description", bob%description, 0)
call assertll ("bob%noinit", bob%noinit, 0)
call assertll ("myfunc(0)", myfunc(0), 0)
call assertll ("myfunc(1)", myfunc(1), 2)
call assertll ("myfunc(0)", myfunc(0), 0)

end program
