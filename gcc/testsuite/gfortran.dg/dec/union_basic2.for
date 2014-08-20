      ! { dg-do run }
      ! { dg-options "-fdec-structure" }
      !
      ! Tests a basic union.
      !

      include 'assert.inc'
      program main

      structure /test/
        integer*4 long
      end structure

      structure /words_long/ 
        union 
          map 
            integer*2  w1, w2
          end map 
          map 
            integer*4  long
          end map 
        end union 
      end structure 

      record /words_long/ x
      record /test/ t
      integer*2, parameter :: w1 = z'1234', w2 = z'5678'

      x.long = z'56781234'

      call assertii ("x.w1", x.w1, w1)
      call assertii ("x.w2", x.w2, w2)

      end program main
