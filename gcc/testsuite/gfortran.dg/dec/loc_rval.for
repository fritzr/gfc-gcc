      ! { dg-do run }
      ! { dg-options "-floc-rval" }
      !
      ! Test the usage of %loc as an rvalue with -floc-rval.
      !

      include 'assert.inc'
      program main
      integer j

      integer :: i, k
      
      i =  loc ( j )
      j = %loc ( j )

      call assertll (i, j)

      end program
