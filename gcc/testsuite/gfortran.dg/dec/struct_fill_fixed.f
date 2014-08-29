      ! { dg-do compile }
      ! { dg-options "-fdec-structure" }
      !
      ! Test the %FILL component extension.
      !
      include 'assert.inc'

      program main

      structure /s/
        integer*2 i
        integer*2 %fill
        integer*2 j
      end structure

      structure /s2/
        character buf(6)
      end structure

      record /s/ x
      record /s2/ y
      equivalence (x, y)

      x.i = z'3130'
      x.j = z'3332'

      call assertss ("[0]", y.buf(1), "0")
      call assertss ("[1]", y.buf(2), "1")
      call assertss ("[2]", y.buf(5), "2")
      call assertss ("[3]", y.buf(6), "3")

      end program
