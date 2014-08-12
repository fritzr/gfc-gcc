      ! { dg-do run }
      ! { dg-options "-fdec-static -finit-local-zero" }
      !
      ! Test the keywords automatic and static with -fdec-static.
      ! STATIC behaves like SAVE, and AUTOMATIC protects variables from
      ! blanket SAVEs.
      !
      subroutine automatic (x, y)
        integer x, y, c ! { dg-warning "will not be SAVEd" }
        integer, automatic :: z ! { dg-warning "will not be SAVEd" }
        automatic c
        save ! nothing saved, everything is un-saveable
        c = c + 1
        if (x /= y) then
          z = z + 1
        endif
      endsubroutine

      subroutine static (x, y)
        integer x, y, c ! c will be static
        integer, static :: z = 0 ! { dg-warning "Duplicate SAVE" }
        save
        c = c + 1
        if (x /= y) then
          z = z + 1
        endif
      endsubroutine

      program main
        integer x, y, z, a, b, c
        automatic x, y, z
        static a, b, c
        x = 1
        y = 2
        z = 3
        a = 4
        b = 5
        c = 6
        call automatic(x, y)
        call automatic(x, y)
        call automatic(x, y)
        call static(x, y)
        call static(x, y)
        call static(x, y)
      end program
