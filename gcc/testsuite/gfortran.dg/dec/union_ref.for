      ! { dg-do run }
      ! { dg-options "-fdec-structure -fno-range-check" }
      !
      ! Ensure array and component references are calculated correctly for
      ! unions.
      !

      include 'assert.inc'
      program main

      structure /test/
      union
        map
          character*20 m
        end map
        map
          integer*4 a, b, c
        end map
      end union
      end structure

      record /test/ x

      x.m = "CDEFGHIJKLMNOPQRSTUV"

      call assert ('x.m(1:1)', x.m(1:1).eq.'C')

      END PROGRAM MAIN

