! { dg-do run }
! { dg-options "-fdec-structure -fno-range-check" }
!
! Simulation of 64-bit intel register and its various access modes
! using the fortran union construct. Tests correctness of nested unions.
!

include 'assert.inc'
program main

structure /reg/

union     ! rax
map
  integer*8 rx
  end map
map
  integer*4 rh

  union   ! eax
  map
    integer*4 rl
    end map
  map
    integer*4 ex
    end map
  map
    integer*2 eh

    union ! ax
    map
integer*2 el
end map
    map
integer*2 x
end map
    map
integer*1 h
integer*1 l
    end map
    end union

  end map
  end union

end map
end union

end structure


record /reg/ a ! rax

integer*8, parameter :: rax = z'AABBCCCCFFFFFFFF'
integer*4, parameter :: rah =         z'FFFFFFFF'
integer*4, parameter :: ral = z'AABBCCCC'

integer*4, parameter :: eax = z'AABBCCCC'
integer*2, parameter :: eah =     z'CCCC'
integer*2, parameter :: eal = z'AABB'

integer*2, parameter ::  ax = z'AABB'
integer*1, parameter ::  ah =   z'BB'
integer*1, parameter ::  al = z'AA'

a.rx = z'AABBCCCCFFFFFFFF'

call assertqq ('rax', a.rx, rax)
call assertll ('rah', a.rh, rah)
call assertll ('ral', a.rl, ral)

call assertll ('eax', a.ex, eax)
call assertii ('eah', a.eh, eah)
call assertii ('eal', a.el, eal)

call assertii (' ax',  a.x,  ax)
call assertbb (' ah',  a.h,  ah)
call assertbb (' al',  a.l,  al)

end program main
