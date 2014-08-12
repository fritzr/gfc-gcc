! { dg-do run }
! { dg-options "-fdec-structure -finit-local-zero -finit-derived" }
!
! Test initialization of a structure containing a union with -finit-derived.
!

include 'assert.inc'
program main

structure /test/
  integer*4 long
end structure

structure /words_long/ 
  union 
    map 
integer*2  w1, w2, w3 
    end map 
    map 
integer*4  long
    end map 
  end union 
end structure 

record /words_long/ x
record /test/ t

call assertii ("x.w1", x.w1, 0_2)
call assertii ("x.w2", x.w2, 0_2)
call assertii ("x.w3", x.w3, 0_2)

x.long = z'56781234'

call assertii ("x.w1", x.w1, 4660_2)  ! 0x1234
call assertii ("x.w2", x.w2, 22136_2) ! 0x5678
call assertii ("x.w3", x.w3, 0_2)     ! untouched

end program main
