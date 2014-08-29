      ! { dg-do run }
      ! { dg-options "-fdec-structure -fno-range-check" }
      !
      ! Test old-style initializations for structure components.
      ! 
      SUBROUTINE DUMP (X)
      INTEGER,PARAMETER :: AS = 3
      STRUCTURE /T/
        CHARACTER*20 C
        INTEGER*1 I
        INTEGER*2 J
        INTEGER   K
        INTEGER*4 L
        INTEGER   M(5)
        INTEGER   N(5)
        INTEGER   O(AS)
        INTEGER   P(2,2)
        REAL      Q(3)
      END STRUCTURE
      RECORD /T/ X

      PRINT *, "C) ", X%C
      PRINT *, "I) ", X%I
      PRINT *, "J) ", X%J
      PRINT *, "K) ", X%K
      PRINT *, "L) ", X%L
      PRINT *, "M) ", X%M
      PRINT *, "N) ", X%N
      PRINT *, "O) ", X%O
      PRINT *, "P) ", X%P
      WRITE (*,'(a4)',advance='no'), " Q) "
      WRITE (*,'(f6.4,a1,f6.4,a1,f6.4)'), X%Q(1), "", X%Q(2), "", X%Q(3)

      call abort
      END SUBROUTINE

      subroutine assert (x, s, i1, i2)
        character*(*) s
        integer i1, i2
        logical b
        INTEGER,PARAMETER :: AS = 3
        STRUCTURE /T/
          CHARACTER*20 C
          INTEGER*1 I
          INTEGER*2 J
          INTEGER   K
          INTEGER*4 L
          INTEGER   M(5)
          INTEGER   N(5)
          INTEGER   O(AS)
          INTEGER   P(2,2)
          REAL      Q(3)
        END STRUCTURE
        RECORD /T/ X
        if ( i1 .ne. i2 ) then
          print *, s, ": expected ", i2, " but was ", i1
          call dump (x)
        endif
      end subroutine

      PROGRAM MAIN
      INTEGER,PARAMETER :: AS = 3
      STRUCTURE /T/
        CHARACTER*20 C /"hello"/  ! OK
        INTEGER*1 I /300_2/       ! bad, but still compiles; overflows int_1
        INTEGER*2 J /300_4/       ! OK, converted
        INTEGER   K /65536_8/     ! OK, implicit
        INTEGER   L /200000/      ! OK, types match
        INTEGER   M(5) /5,4,3,2,1/! OK
        INTEGER   N(5) /1,3*2,1/  ! OK, with repeat spec (/1,2,2,2,1/)
        INTEGER   O(AS) /AS*9/    ! OK, parameter array spec
        INTEGER   P(2,2) /1,2,3,4/! OK
        REAL      Q(3) /1_2,3.5,2.4e-12_8/ ! OK, with some implicit conversions
      END STRUCTURE

      RECORD /T/ X

      ! do these by hand to avoid fortran type bs
      if ( x%i .ne. 44 ) then
        print *, "x%i: expected 44 but was ", x%i
        call dump(x)
      else if ( x%j .ne. 300 ) then
        print *, "x%j: expected 300 but was ", x%j
        call dump(x)
      endif
      call assert ( x, "x%k", x%k, 65536 )
      call assert ( x, "x%l", x%l, 200000 )

      call assert ( x, "x%m(1)", x%m(1), 5 )
      call assert ( x, "x%m(2)", x%m(2), 4 )
      call assert ( x, "x%m(3)", x%m(3), 3 )
      call assert ( x, "x%m(4)", x%m(4), 2 )
      call assert ( x, "x%m(5)", x%m(5), 1 )

      call assert ( x, "x%n(1)", x%n(1), 1 )
      call assert ( x, "x%n(2)", x%n(2), 2 )
      call assert ( x, "x%n(3)", x%n(3), 2 )
      call assert ( x, "x%n(4)", x%n(4), 2 )
      call assert ( x, "x%n(5)", x%n(5), 1 )

      call assert ( x, "x%o(1)", x%o(1), 9 )
      call assert ( x, "x%o(2)", x%o(2), 9 )
      call assert ( x, "x%o(3)", x%o(3), 9 )

      call assert ( x, "x%p(1,1)", x%p(1,1), 1 )
      call assert ( x, "x%p(2,1)", x%p(2,1), 2 )
      call assert ( x, "x%p(1,2)", x%p(1,2), 3 )
      call assert ( x, "x%p(2,2)", x%p(2,2), 4 )

      END PROGRAM
