      ! { dg-do compile }
      ! { dg-options "-fdec-io" }
      !
      ! Tests CARRIAGECONTROL='FORTRAN'.
      !

      subroutine writeall (s, fd1)
        implicit none
        character*(*) s
        integer fd1
        write (fd1,*) s
      endsubroutine

      subroutine readall (s, fd)
        implicit none
        integer i, fd, st
        character*(*) s
        character*19 buf
        print *, "===> ", s, " <==="
        st = 0
        read (fd,'(a)',iostat=st) buf
        do while (st .eq. 0)
          print *, buf
          read (fd,'(a)',iostat=st) buf
        enddo
      endsubroutine

      program main

      integer, parameter :: deffd=3
      character*(*), parameter :: def   = "cc-fort.txt"

      open(unit=deffd,  file=def, action ="WRITE",
     &     carriagecontrol="FORTRAN")

      call writeall  ("+hi", deffd)
      call writeall  ("-hi", deffd)
      call writeall  ("0hi", deffd)
      call writeall  ("1hi", deffd)
      call writeall  ("$hi", deffd)
      call writeall  (" hi", deffd)
      call writeall  ("h	i", deffd)
      call writeall  ("o k b y e n o w", deffd)

      close(unit=deffd)

      open(unit=deffd,  file=def, action ="READ",
     &     carriagecontrol="FORTRAN")

      call readall ("fort", deffd)

      close(unit=deffd)

      end program
