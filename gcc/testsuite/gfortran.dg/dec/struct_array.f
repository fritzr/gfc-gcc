      ! { dg-do run }
      ! { dg-options "-fdec-structure" }
      !
      ! Test arrays of structures.
      !
      include 'assert.inc'
      program main
      implicit none

      structure /t/
        integer z
      end structure

      structure /big/
        integer x
        record /t/ y
      end structure

      record /big/ array(10)
      integer i 

      array(3).y.z = 10
      i = array(3).y.z

      call assertll ("array(3).y.z", i, 10)

      end program
