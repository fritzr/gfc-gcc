      ! { dg-do run }
      ! { dg-options "-fdec-structure -finit-derived -finit-local-zero" }
      !
      ! Test explicit initialization expressions within unions mixed with
      ! -finit-derived.
      !

      include 'assert.inc'
      program main

      structure /test/
      integer :: i = 8
      union
      map
      integer*2 :: x = 1600
      integer*2 :: y = 1600
      end map
      map
      integer*2 a,b,c,d,e
      end map
      end union
      end structure

      record /test/ t

      call assertll ("i", t.i, 8)
      call assertii ("x", t.x, 1600_2)
      call assertii ("x", t.x, 1600_2)

      call assertii ("a", t.a, 1600_2)
      call assertii ("b", t.b, 1600_2)
      call assertii ("c", t.c, 0_2)
      call assertii ("d", t.d, 0_2)
      call assertii ("e", t.e, 0_2)

      end program
