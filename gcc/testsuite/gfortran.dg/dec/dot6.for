      ! { dg-do run }
      ! { dg-options "-fdec-member-dot" }
      !
      ! This should compile with -fdec-member-dot.
      ! This tests the precedence between member accesses, intrinsic
      ! operators, and user-defined operators.
      !
      ! (1) t2.eq.i     should be the member access (t2->eq)->i
      ! (2) (t2).eq.i   should be the operation eq(t2, i)
      ! (3) t2.test.i   is the operation test(t2, i) (because Intel does that)
      ! (4) (t2).test.i is still the operation test(t2, i) (ditto)
      !
      ! The output should be:
      ! 1
      ! 5
      ! 6
      ! 6
      include 'assert.inc'
      module mod
      type T1_t
          integer :: i
      end type T1_t
      type T2_t
          integer :: i
          type (T1_t) :: eq
          type (T1_t) :: test
      end type T2_t
       
      interface operator (.eq.)
          module procedure eq_func
      end interface operator (.eq.)

      interface operator (.test.)
          module procedure tstfunc
      end interface operator (.test.)

      contains

      function eq_func(t2, i)
          type(T2_t), intent (in) :: t2
          integer, intent (in) :: i
          integer eq_func
          eq_func = t2%eq%i + i
          return
      end function eq_func

      function tstfunc(t1, i)
          type(T2_t), intent (in) :: t1
          integer, intent (in) :: i
          integer tstfunc
          tstfunc = t1%i + i
          return
      end function tstfunc

      end module mod

      use mod

      type(T2_t) :: t2
      integer :: i
      t2%eq%i = 1
      t2%i = 2
      t2%test%i = 3
      i = 4

      call assertll ("t2.eq.i",      t2  .eq. i, 1) ! (1) t2->eq->i = 1
      call assertll ("(t2).eq.i",   (t2) .eq. i, 5) ! (2) eq_func(t2,i) = 5
      call assertll ("t2.test.i",    t2 .test.i, 6) ! (3) tstfunc(t2,i) = 6
      call assertll ("(t2).test.i", (t2).test.i, 6) ! (4) tstfunc(t2,i) = 6

      end program
