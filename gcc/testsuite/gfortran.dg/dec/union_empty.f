      ! { dg-do compile }
      ! { dg-options "-fdec-structure" }
      !
      ! Allow compilation of a structure with an empty union.
      !
      program main
      structure /test/
        integer i
        union
          map
          end map
          map
          end map
        end union
      end structure
      end program main

