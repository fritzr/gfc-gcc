! This is a horrible example of how twisted Fortran is:
! "X.AND.AND.AND.AND" resolves to (X.AND.AND) .AND. (AND)
! because ".AND." is defined to take (LOGICAL, T) parameters 
! where "X.AND.AND" is type LOGICAL and "AND" is type T.
! Without the knowledge of the type of parameters expected by the
! user-defined ".AND.", this would be completely ambiguous.
      module mod

      TYPE t2
          logical y
      END TYPE

      TYPE t1
          logical and
      END TYPE
        
      interface operator (.and.)
          module procedure a
      end interface operator (.and.)

      interface operator (.or.)
          module procedure b
      end interface operator (.or.)

      contains

      function a(x, y)
          type(t1), intent (in) :: x
          logical, intent (in) :: y
          logical a
          print *, 'called and'
          a = (.not. x%and) .and. (.not. y)
          return
      end function a

      function b(x, y)
          logical, intent (in) :: x
          type(t2), intent (in) :: y
          logical b
          print *, 'called or'
          b = (.not. x) .and. (.not. y%y)
          return
      end function b

      end module mod

      use mod

      TYPE(t1) :: x
      TYPE(t2) :: or
      LOGICAL  :: y
      LOGICAL :: i
      x.and = .true.
      or.y  = .true.
      y = .true.

      ! could be...
      !   (x) .and. (or.y)  * but this is the chosen one
      !   (x.and) .or. (y)
      i = x.and.or.y 

      if ( i ) then ! (x->and) .AND. (z)
          print *, .true.
      endif

      end program
