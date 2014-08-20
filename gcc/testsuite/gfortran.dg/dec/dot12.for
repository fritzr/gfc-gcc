      ! { dg-do compile }
      ! { dg-options "-fdec-member-dot" }
      !
      ! This should compile with -fdec-member-dot.
      ! This tests the precedence between member accesses and intrinsic
      ! operators.
      !
      ! "x.and.y" should be interpreted as the nested access
      ! (x->and)->y rather than the logical operation and(x,y). The result
      ! should be OR'd with z. 
      !
      ! The output is unimportant; if the precedence described above is not
      ! recognized, the program will fail to compile.
      program main

      TYPE bob
          LOGICAL y
      END TYPE

      TYPE item
          LOGICAL b
          TYPE(bob) and
      END TYPE

      TYPE(item) x, y
      LOGICAL z

      if ( x .AND. y .OR. z ) then
      endif

      end program
