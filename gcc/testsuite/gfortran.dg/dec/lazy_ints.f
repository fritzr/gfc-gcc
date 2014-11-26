      ! { dg-options "-flazy-types" }
      ! { dg-do run }
      ! Tests the conversions between integers and logicals using
      ! -flazy-types. This helps compatibility with old (albeit faulty) code.

      subroutine abortis (i, s)
        integer, intent(in) :: i
        character(*), intent(in) :: s
        write (*, '(a,i2,a,a)') "(ti = ", i, ") ", s
        call abort()
      end subroutine

      subroutine aborts (s)
        character(*), intent(in) :: s
        print *, s
        call abort()
      end subroutine

      program main

      integer tis(2) /-1,1/
      integer :: i = 1       ! ti = tis(ind)
      integer :: ti          ! true int
      integer :: fi = 0      ! false int
      logical :: tl = .true. ! true bool
      logical :: fl          ! false bool

      if (fi) call aborts ("    false int")
      if (.not. fi) then
      else
        call aborts ("not false int")
      endif

      if (fl .ne. .false.) call aborts ("false bool .ne.")
      if (tl .ne. .true.)  call aborts ("true  bool .ne.")
      if (fl .eq. .false.) then
      else
        call aborts ("false bool .eq.")
      endif
      if (tl .eq. .true.) then
      else
        call aborts ("true  bool .eq.")
      endif

      if (tl .eq. fi) call aborts ("true  bool == false int")
      if (fl .ne. fi) call aborts ("false bool != false int")

      ! Test how non-zero integers handle as logicals
      ! -1 as true provides Intel compatibility, 1 as true works otherwise
      do while ( i .le. size(tis) )
        ti = tis(i)
        if (.not. ti) call abortis (ti, "not true  int")
        if (ti) then
        else
          call abortis (ti, "true  int")
        endif
        if (tl .ne. ti) call abortis (ti, "true  bool != true  int")
        if (fl .eq. ti) call abortis (ti, "false bool == true  int")

        i = i + 1
      end do

      end program
