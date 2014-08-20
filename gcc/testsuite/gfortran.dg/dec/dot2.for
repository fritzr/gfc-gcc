      ! { dg-do compile }
      ! { dg-options "-fdec-member-dot" }
      !
      ! Make sure logical names aren't interpreted as member accesses.
      !
      PROGRAM MAIN
      LOGICAL :: AND
      AND = AND.AND.AND.AND.AND
      END PROGRAM
