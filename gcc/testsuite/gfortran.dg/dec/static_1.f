      ! { dg-do run }
      ! { dg-options "-fdec-static -finit-local-zero" }
      !
      ! Test AUTOMATIC and STATIC attributes.
      !
      include 'assert.inc'

      function f (x, y)
        integer f, x, y, a      ! only a can actually be saved
        integer, automatic :: c ! should actually be automatic
        save

        ! a should be incremented by x every time and saved
        a = a + x 
        f = a

        ! c should be zeroed every time, therefore equal y
        c = c + y 
        call assertll ("f%c", c, y)
        return
      endfunction

      implicit none
      integer f

      ! Should return static value of a; accumulates x
      call assertll ("f()", f(1,3), 1)
      call assertll ("f()", f(1,4), 2)
      call assertll ("f()", f(1,2), 3)

      end
