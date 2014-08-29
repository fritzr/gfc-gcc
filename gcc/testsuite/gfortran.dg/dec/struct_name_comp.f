      ! { dg-do compile }
      ! { dg-options "-fdec-structure" }
      !
      ! Make sure the name of a component does not conflict with the name of a
      ! variable. 
      !
      program main

      structure /t1/
        integer*4 comp
      end structure
      record /t1/ comp
      structure /t2/
        integer*4 comp
      end structure

      end program
