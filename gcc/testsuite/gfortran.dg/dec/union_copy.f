      ! { dg-do run }
      ! { dg-options "-fdec-structure" }
      !
      ! Tests whether union backend declarations are correctly /not/
      ! copied when they are not in fact equal.

      include 'assert.inc'

      function test1 (x)
      implicit none
      integer x, test1

      ! The BUFFER structure is first seen here.
      integer*4 L_bbuf
      parameter (L_bbuf=1024)
      include 'buffer.inc'
      record /buffer/ buf

      buf.lbuf(1) = z'badbeef'
      buf.lbuf(2) = z'badbeef'
      buf.lbuf(3) = z'badbeef'
      buf.lbuf(4) = z'badbeef'

      if (x .ge. 0 .and. x .le. 4) then
        test1 = buf.lbuf(x)
      else
        test1 = buf.lbuf(1)
      endif

      return
      endfunction

      function test2 (x)
      implicit none
      integer x, test2

      ! This is the second BUFFER structure, seen with different
      ! parameters. Though the declarations are identical, the backend
      ! from the first union should NOT be copied since it is of
      ! different size. If it is in fact copied, this may cause
      ! discrepancies in translation leading to overwriting important
      ! pieces of the stack due to initialization (such as the return value).
      integer*4 L_bbuf
      parameter (L_bbuf=65536)
      include 'buffer.inc'
      record /buffer/ buf

      buf.lbuf(1) = z'beefbad'
      buf.lbuf(2) = z'beefbad'
      buf.lbuf(3) = z'beefbad'
      buf.lbuf(4) = z'beefbad'

      if (x .ge. 0 .and. x .le. 4) then
        test2 = buf.lbuf(x)
      else
        test2 = buf.lbuf(1)
      endif

      return
      endfunction

      program main
      implicit none
      integer x, y, test1, test2

      x = test1(2)
      y = test2(3)
      call assertll ("test1", x, 195935983) ! 0xbadbeef
      call assertll ("test2", y, 200211373) ! 0xbeefbad

      end program
