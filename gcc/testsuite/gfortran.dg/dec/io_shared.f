      ! { dg-do compile }
      ! { dg-options "-fdec-io" }
      !
      ! Tests compilation of the SHARE= specifier family. A more
      ! complete test should be created which actually checks that the
      ! correct fcntl() is made at runtime.
      !
      program main

      character*20, parameter :: fname='test.txt'
      integer fd

      open (unit=fd, file=fname, action='read', shared)
      open (unit=fd, file=fname, action='read', noshared)
      open (unit=fd, file=fname, action='read', share='denynone')
      open (unit=fd, file=fname, action='read', share='denyrw')

      end program
