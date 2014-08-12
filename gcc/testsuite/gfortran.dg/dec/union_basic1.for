! { dg-do run }
! { dg-options "-fdec-structure" }
!
! Tests a basic union.
!

include 'assert.inc'
program main

structure /test/
  union
  map
    integer a
  end map
  map
    real b
  end map
  end union
end structure

record /test/ x

x.b = 1.357e2

call assertll ("(int) 1.357e2", x.a, 1124578099)

end program main
