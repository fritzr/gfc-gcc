      ! { dg-do run }
      ! { dg-options "-fdec-static -fno-automatic -finit-local-zero" }
      !
      ! Make sure a warning is produced when variables marked AUTOMATIC
      ! cannot be automatic due to compilation with -fno-automatic, and
      ! that they are in fact still saved.
      !
      include 'assert.inc'

      function f (x, y)
        integer f, x, y, a      ! only a can actually be saved
        integer, automatic :: c ! { dg-warning "marked AUTOMATIC" }
        c = c + y ! should increment by y every time
        f = c
        return
      endfunction

      implicit none
      integer f

      ! Should return static value of a; accumulates x
      call assertll ("f()", f(1,3), 3)
      call assertll ("f()", f(1,4), 7)
      call assertll ("f()", f(1,2), 9)

      end
