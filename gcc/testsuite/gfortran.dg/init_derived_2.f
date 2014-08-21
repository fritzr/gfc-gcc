! { dg-do run }
! { dg-options "-finit-integer=5 -finit-real=nan -finit-logical=true -finit-character=32 -finit-derived -fbackslash" }
!
! Make sure -finit-derived initializes components of local derived type
! variables to parameters given on the command line.
!
      include 'assert.inc'

      implicit none

      type ty
        ! Make sure components are initialized appropriately
        integer i   ! = 5
        real r      ! = nan
        logical l   ! = .true.
        character c ! = ' ' (32)
      end type
      type(ty) t

      ! Make sure locals are still initialized appropriately
      integer ii   ! = 5
      real rr      ! = nan
      logical ll   ! = .true.
      character cc ! = ' ' (32)

      ! Local simply typed variables
      call assertll ("ii",  ii,   5)
      call assert   ("isnan(rr)", ISNAN(rr))
      call assert   ("ll",  ll)
      call assertss ("cc",  cc,   ' ')

      ! Local derived type variables
      call assertll ("t%i",  t%i,  5)
      call assert   ("isnan(t%r)", ISNAN(t%r))
      call assert   ("t%l",  t%l)
      call assertss ("t%c",  t%c,  ' ')

      end
