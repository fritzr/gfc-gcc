      ! { dg-do compile }
      ! { dg-options "-fdec-io" }
      !
      ! Tests the READONLY flag. A more complex test should be done
      ! which actually exercises the runtime protection of delete on
      ! close.
      !
      program main

      character*20, parameter :: fname='test.txt'
      integer :: fd = 1
      !character*100 cdata

      open (unit=fd, file=fname, readonly)

      !read (fd,'(a)') cdata
      !write (*,'(a)') cdata

      !write (fd,'(a)') cdata ! should cause runtime error

      close (unit=fd) !, status='delete') ! should cause runtime error/warning

      end program
