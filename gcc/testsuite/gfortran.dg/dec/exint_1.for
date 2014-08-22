      ! { dg-do compile }
      ! { dg-options "-fdec-extended-int" }
      !
      ! Test the DEC extended integer format 'base#value' in several
      ! contexts.
      !

      include 'assert.inc'
      program main
      implicit integer(a-z)
      integer(kind=2#100) I ! 100 base 2 => 4
      integer(5#13)       J ! 13  base 5 => 8
      integer*3#11     :: K ! { dg-error "Old-style.*INTEGER.3" }
      I     = #3D + 2
      J     = 16 # 3f
      K     = 2 #  1000000 - 6   # 1 
      L     = -(-4#3 + 5#231)
      M     = '3F'X
      N     = 36#1R
      O     = (-1)#4        ! { dg-error "Unclassifiable statement" }
      P     = 0#10          ! { dg-error ".0. out of range" }
      Q     = 1#0000        ! { dg-error ".1. out of range" }
      R     = 37#XYZ14      ! { dg-error ".37. out of range" }
      S     = 10#123456789A ! { dg-error "Invalid digit .a." }
      T     = 16#3hfba      ! { dg-error "Invalid digit .h." }
      U     = 13#           ! { dg-error "Expected.*after .#." }
      write (*,3#22) x'BEEF'! { dg-error "Syntax error" }
3#22  format (z8)           ! { dg-error "character in" }
      call assertll ("i", i,  63)
      call assertll ("j", j,  63)
      call assertqq ("k", k,  63_8) ! K should have kind 8
      call assertll ("l", l, -63)
      call assertll ("m", m,  63)
      call assertll ("n", n,  63)
      end program main
