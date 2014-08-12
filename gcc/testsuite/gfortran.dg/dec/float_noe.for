      ! { dg-do run }
      ! { dg-options "-fdec-io" }
      !
      ! Tests the extension to libgfortran which allows a floating point
      ! number such as '1e' to be recognized as '1e0'.
      !

      program main
      implicit none
      real*4 d
      character*20 :: tmp = "1e"

      read (tmp,*,ERR=20) d
      write (*,'(a,g10.4)') "pass", d
      stop

20    print *, "FAIL!!!!"
      call abort
      end program
