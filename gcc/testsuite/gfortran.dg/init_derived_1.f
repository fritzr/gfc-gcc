! { dg-do run }
! { dg-options "-finit-local-zero -finit-derived -fbackslash" }
!
! Make sure -finit-derived with -finit-local-zero initializes components
! of local derived type variables to zero without overriding explicit default
! initializers.
!
      include 'assert.inc'

      implicit none

      type ty
        ! Make sure components are initialized to zero
        integer i1
        real r1
        logical l1
        character c1
        ! Make sure explicit default initializers are not overridden
        integer :: i2 = 1
        real :: r2 = 1.0
        logical :: l2 = .true.
        character :: c2 = 'x'
      end type
      type(ty) t

      ! Make sure locals are still initialized to zero
      integer ii1
      real rr1
      logical ll1
      character cc1

      ! Make sure locals' initializers are not overwritten
      integer :: ii2 = 1
      real :: rr2 = 1.0
      logical :: ll2 = .true.
      character :: cc2 = 'x'

      ! Local simply typed variables
      call assertll ("ii1",  ii1,  0)
      call assertrr ("rr1",  rr1,  0.0)
      call assert   ("ll1",  .not. ll1)
      call assertss ("cc1", cc1, '\0')

      call assertll ("ii2",  ii2,  1)
      call assertrr ("rr2",  rr2,  1.0)
      call assert   ("ll2",  ll2)
      call assertss ("cc2", cc2, 'x')

      ! Local derived type variables
      call assertll ("t%i1",  t%i1,  0)
      call assertrr ("t%r1",  t%r1,  0.0)
      call assert   ("t%l1",  .not. t%l1)
      call assertss ("t%c1", t%c1, '\0')

      call assertll ("t%i2",  t%i2,  1)
      call assertrr ("t%r2",  t%r2,  1.0)
      call assert   ("t%l2",  t%l2)
      call assertss ("t%c2",  t%c2, 'x')

      end
