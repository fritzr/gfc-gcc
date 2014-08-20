      ! { dg-do compile }
      ! { dg-options "-fdec-structure" }
      !
      ! This program gives a warning with gfortran because the
      ! initialization of Z overwrites the initializations given in X
      ! and Y.

      ! The Intel documentation states that the last initializer to
      ! appear is the prevailing initializer; however, ifort 11.1 does
      ! not seem to follow this (it seems to use the initializers for X
      ! and Y rather than Z).

      ! The correct behavior in the future is to initialize the first
      ! four bytes of the union with 7777777 and the last two bytes
      ! with 100.
      program main

      structure /test/
      integer :: i = 8
      union
      map
      integer*2 :: x = 1600
      integer*2 :: y = 1600
      end map
      map
      integer*4 :: z = 7777777 ! { dg-warning "overwritten by initializer" }
      end map
      map
      integer*4 a,b,c,d
      integer*2 :: e = 100 ! { dg-warning "overwritten by initializer" }
      end map
      end union
      end structure

      end program
