      ! { dg-do compile }
      ! { dg-options "-fdec-structure" }
      !
      ! Test error checking for old-style initializations of structure components.
      ! 

      PROGRAM MAIN
      INTEGER,PARAMETER :: AS = 3
      STRUCTURE /T/
        INTEGER   T(AS) /4*9/    ! { dg-error "Too many elements" }
        INTEGER   U /1,2,3/      ! { dg-error "End of scalar initializer expected" }
        INTEGER   V /"hi"/       ! { dg-error "Can't convert" }
        INTEGER   W(3) /1,3/     ! { dg-error "Not enough elements" }
        INTEGER   X(3) /1,3,5,7/ ! { dg-error "Too many elements" }
        INTEGER   Y(3) /2*1/     ! { dg-error "Not enough elements" }
        INTEGER   Z(3) /10*1/    ! { dg-error "Too many elements" }
      END STRUCTURE

      END PROGRAM
