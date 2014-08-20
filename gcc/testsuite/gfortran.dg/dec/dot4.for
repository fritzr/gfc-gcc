      ! { dg-do run }
      ! { dg-options "-fdec-member-dot" }
      !
      ! This should compile with -fdec-member-dot.
      ! Test to make sure initializers and operators beginning with '.'
      ! are not interpreted as structure member accesses.
      ! Output should be "T T", and this should compile with -fdec-member-dot.
      include 'assert.inc'
      program main
      implicit none

      logical :: b = .TRUE.
      logical :: c = .TRUE.
      call assert ("b.eqv.c", b.eqv.c)
      call assert ("(b).eqv.c", (b).eqv.c)

      end program
