
      subroutine assert(s, b)
        character*(*) s
        logical b
        if (.not. b) then
          print *, s
          call abort
        endif
      endsubroutine

      subroutine assertss(s, s1, s2)
        character*(*) s, s1, s2
        if (s1 /= s2) then
          print *, s, ": expected ", s2, " but was ", s1
          call abort
        endif
      endsubroutine

      subroutine assertbb(s, b1, b2)
        character*(*) s
        integer(1) b1, b2
        if (b1 .ne. b2) then
          print *, s, ": expected ", b2, " but was ", b1
          call abort
        endif
      endsubroutine

      subroutine assertii(s, i1, i2)
        character*(*) s
        integer(2) i1, i2
        if (i1 .ne. i2) then
          print *, s, ": expected ", i2, " but was ", i1
          call abort
        endif
      endsubroutine

      subroutine assertll(s, l1, l2)
        character*(*) s
        integer(4) l1, l2
        if (l1 .ne. l2) then
          print *, s, ": expected ", l2, " but was ", l1
          call abort
        endif
      endsubroutine

      subroutine assertqq(s, q1, q2)
        character*(*) s
        integer(8) q1, q2
        if (q1 .ne. q2) then
          print *, s, ": expected ", q2, " but was ", q1
          call abort
        endif
      endsubroutine

      subroutine assertrr(s, r1, r2)
        character*(*) s
        real r1, r2
        if (r1 .ne. r2) then
          print *, s, ": expected ", r1, " but was ", r2
          call abort
        endif
      endsubroutine
