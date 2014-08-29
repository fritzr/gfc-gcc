      ! { dg-do run }
      ! { dg-options "-fdec-member-dot" }
      !
      ! This should compile with -fdec-member-dot.
      !
      ! Tests whether string literals as operands inhibit recognizing '.' as
      ! a member separator. 
      !
      ! Output should be "pass".
      PROGRAM MAIN
      TYPE t
          CHARACTER*20 :: a
          CHARACTER*20 :: b
      END TYPE

      CHARACTER*20 :: tmp1 = "HELLO"
      CHARACTER*20 :: tmp2 = "GOODBYE"
      TYPE (t) tmp3
      tmp3.a = "HELLO"
      tmp3.b = "GOODBYE"

      if     ( .not. (tmp1.eq."HELLO")   ) then
          print *, "FAIL!!!! Hello"
          call abort

      elseif ( .not. ("GOODBYE".eq.tmp2)   ) then
          print *, "FAIL!!!! Goodbye"
          call abort

      elseif ( .not. (tmp3.a.eq."HELLO") ) then
          print *, "FAIL!!!! ->Hello"
          call abort

      elseif ( .not. ("GOODBYE".eq.tmp3.b) ) then
          print *, "FAIL!!!! ->Goodbye"
          call abort

      endif

      END PROGRAM
