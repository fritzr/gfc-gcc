      ! { dg-do run }
      ! { dg-options "-fdec-logical-xor -ffixed-form" }
      !
      ! Test the logical XOR operator.
      !

      program main
      implicit none
      logical a, b, c, n, x, d(2)
      integer i, j
      d(1) = .true.
      d(2) = .false.
      do 10 i = 1,2
        do 11 j = 1,2
            a = d(j)
            b = d(i)
            n = a .neqv. b
            x = a .xor. b
            if ( n .neqv. x ) then
                print *, "(",a,b,") fail!!!! NEQV: ", n, "  XOR: ", x
                call abort
            else
                print *, "(",a,b,") PASS"
            endif
11      enddo
10    enddo
      end program main
