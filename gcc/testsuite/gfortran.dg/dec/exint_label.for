      ! { dg-do compile }
      ! { dg-options "-fdec-extended-int" }
      !
      ! Test the DEC extended integer format 'base#value' in a format
      ! label.
      !
      program main
      write (*,3#22) X'BEEF'
8     format (z8)
      end program main
