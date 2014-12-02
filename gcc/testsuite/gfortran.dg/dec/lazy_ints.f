      ! { dg-options "-flazy-logicals" }
      ! { dg-do run }
      ! Tests the conversions between integers and logicals using
      ! -flazy-types. This helps compatibility with old (albeit faulty) code.

      subroutine abortis (i, s)
        integer, intent(in) :: i
        character(*), intent(in) :: s
        write (*, '(a,i2,a,a)') "(int = ", i, ") ", s
        call abort()
      end subroutine

      subroutine aborts (s)
        character(*), intent(in) :: s
        print *, s
        call abort()
      end subroutine

      program main

      integer tis(7) /1,-1, -5,-3,3,5,7/
      integer fis(7) /0, 2, -6,-4,-2,4,6/
      integer :: ii = 1            ! [ft]i = [ft]is(ii)
      integer :: fi, ti            ! false int, true int
      logical :: tl = .true.       ! true logical
      logical :: fl = .false.      ! false logical

      ! Test behavior of logicals with eq/ne instead of eqv/neqv
      if (fl .ne. .false.) call aborts ("false logical .ne.")
      if (tl .ne. .true.)  call aborts ("true  logical .ne.")
      if (fl .eq. .false.) then
      else
        call aborts ("false logical .eq.")
      endif
      if (tl .eq. .true.) then
      else
        call aborts ("true  logical .eq.")
      endif

      ! Test how integers handle as logicals
      ! For compatibility with Intel and other Fortran compilers, we
      ! define an integer as true if its lsb is 1, false if it is 0.
      do while ( ii .le. size(tis) )
        fi = fis(ii)
        ti = tis(ii)

        if (fi) call abortis (fi, "false int")
        if (.not. fi) then
        else
          call abortis (fi, "not false int")
        endif
c       In Intel FT, .false. is only .eq. 0
        if (fi .eq. 0) then
          if (tl.eq.fi) call abortis (fi, "true  logical ==  false int")
          if (fl.ne.fi) call abortis (fi, "false logical !=  false int")
        endif
        if (tl .eqv. fi) call abortis (fi,"true  logical === false int")
        if (fl .neqv. fi) call abortis(fi,"false logical !== false int")

        if (.not. ti) call abortis (ti, "not true int")
        if (ti) then
        else
          call abortis (ti, "true int")
        endif
c       In Intel FT, .true. is only .eq. -1
        if (ti .eq. -1) then
          if (tl.ne.ti) call abortis (ti,  "true  logical !=  true int")
          if (fl.eq.ti) call abortis (ti,  "false logical ==  true int")
        endif
        if (tl .neqv. ti) call abortis (ti,"true  logical !== true int")
        if (fl .eqv. ti) call abortis (ti, "false logical === true int")

        ii = ii + 1
      end do

      end program
