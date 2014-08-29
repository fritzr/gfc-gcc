      ! { dg-do run }
      ! { dg-options "-fdec-static -fno-automatic -finit-local-zero" }
      !
      ! Make sure a warning is produced when variables marked AUTOMATIC
      ! cannot be automatic due to compilation with -fno-automatic, and
      ! that they are in fact still saved.
      !
      include 'assert.inc'

      function f (x)
      implicit none
        integer f, x
        integer, static :: a ! should be SAVEd
        a = a + x ! should increment by x every time
        f = a
        return
      endfunction

      recursive subroutine g (x)
      implicit none
        integer x
        integer, automatic :: a ! should be automatic (in recursive)
        a = a + x ! should be set to x every time
        call assertll ("g%a", a, x)
      endsubroutine

      subroutine h (x)
      implicit none
        integer x
        integer, automatic :: a ! should be automatic (outside recursive)
        a = a + x ! should be set to x every time
        call assertll ("h%a", a, x)
      endsubroutine

      integer f

      ! Should return static value of c; accumulates x
      call assertll ("f()", f(3), 3)
      call assertll ("f()", f(4), 7)
      call assertll ("f()", f(2), 9)

      call g(3)
      call g(4)
      call g(2)

      call h(3)
      call h(4)
      call h(2)

      end
