! { dg-do run }
! { dg-options "-fdec-structure -fno-range-check" }
!
! Test the correctness of nested unions.
!

include 'assert.inc'
program main
implicit none

structure /nest/
integer*4 a

union     ! u1
map ! u1.m1
  integer*4 b
  integer*4 c
end map
map ! u1.m2
  integer*2 d
  integer*2 e
  integer*4 f
end map
map ! u1.m3
  integer*4 w
  union   ! u1.u2
  map     ! u1.u2.m1
    integer*2 x 
    integer*2 y
  end map
  map     ! u1.u2.m2
    integer*4 z
  end map
  end union
end map
end union

union     ! u2
map ! u2.m1
  integer*8 g
  integer*4 h
end map

map ! u2.m2
  integer*4 i
  integer*8 j
end map
end union

end structure


record /nest/ s
! Use parameters to get around casting problems with hex
integer*4, parameter :: b = z'0000ABCD'
integer*4, parameter :: c = z'FEEDBEEF'
integer*4, parameter :: h = z'FEFEDCBA'
integer*4, parameter :: i = z'87654321'

s.w = z'abcd'
s.x = z'beef'
s.y = z'feed'

s.g = z'1234567887654321'
S.J = z'ABCDEFeFFeFEDCBA'

call assertll ("s.b", s.b, b)
call assertll ("s.c", s.c, c)
call assertll ("s.h", s.h, h)
call assertll ("s.i", s.i, i)

end program main
