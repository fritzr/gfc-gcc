      ! { dg-do run }
      ! { dg-options "-fdec-member-dot" }
      !
      ! This should compile with -fdec-member-dot.
      ! This tests nested member accesses without dots.
      ! The output should be '1'.

      include 'assert.inc'
      program main

      type tg
          integer i
      end type

      type tf
          type(tg) g
      end type

      type te
          type(tf) f
      end type

      type td
          type(te) e
      end type

      TYPE tc
          type(td) d
      end type

      TYPE tb
          type(tc) c
      END TYPE

      TYPE ta
          TYPE(tb) b
      END TYPE

      TYPE(ta) a

      integer i
      a%b%c%d%e%f%g%i = 1
      i = a%b%c%d%e%f%g%i
      call assertll ("a%b%c%d%e%f%g%i", i, 1)

      end program
