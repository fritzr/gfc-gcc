      SUBROUTINE fail_on_true(bool, msg, e, a)
        IMPLICIT NONE
        LOGICAL, INTENT (IN) :: bool
        CHARACTER(*), INTENT (IN) :: msg, e, a
        if ( bool ) then
          print *, msg, "FAIL!!!! exp: ", e, " act: ", a
          call abort
        endif
      END

      SUBROUTINE fail_on_false(bool, msg, e, a)
        IMPLICIT NONE
        LOGICAL, INTENT (IN) :: bool
        CHARACTER(*), INTENT (IN) :: msg, e, a
        if ( .not. bool ) then
          print *, "(", msg, ") FAIL!!!! exp: ", e, " act: ", a
          call abort
        endif
      END
