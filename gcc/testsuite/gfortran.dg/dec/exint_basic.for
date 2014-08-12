      ! { dg-do compile }
      ! { dg-options "-fdec-extended-int" }
      !
      ! Test the DEC extended integer format 'base#value' in several
      ! contexts.
      !

      include 'assert.inc'
      program main
      I     = #3D + 2
      J     = 16 # 3f
      K     = 2 #  1000000 - 6   # 1 
      L     = -(-4#3 + 5#231)
      M     = '3F'X
      call assertll ("i", i,  63)
      call assertll ("j", j,  63)
      call assertll ("k", k,  63)
      call assertll ("l", l, -63)
      call assertll ("m", m,  63)
      end program main
