      ! { dg-do compile }
      ! { dg-options "-fdec-io" }
      !
      ! Tests the SHARED flag. A more complex test should be done
      ! which actually checks that the correct fcntl() is made at
      ! runtime.
      !
      program main

      character*20, parameter :: fname='test.txt'
      integer fd
      character*100 cdata

      open (unit=fd, file=fname, action='read', shared)

      !read (fd,'(a)') cdata
      !write (*,'(a)') cdata

      close (unit=fd)

      end program
