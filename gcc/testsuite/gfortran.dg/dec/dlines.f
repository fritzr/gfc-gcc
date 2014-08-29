      ! { dg-do compile }
      ! { dg-options "-fdec" }
      !
      ! Test the recognition of debug lines as comments with -fdec.
      !
      program main

      character*32 a, b

      a = "debug lines"
      b = "are comments"

D     a = "no comments"
D     b = "for these debug lines"

      print *, a, b

      end program
