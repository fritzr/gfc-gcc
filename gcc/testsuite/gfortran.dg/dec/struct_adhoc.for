! { dg-do run }
! { dg-options "-fdec-structure" }
!
! Test nested/ad-hoc structure definitions.
!
include 'assert.inc'

program main

structure /date/
  integer*1 day, month 
  integer*2 year 
end structure 

type appointment
record/date/app_date 
structure /time/ app_time (2) 
  integer*1       hour, minute 
end structure 
structure/memo/app_memo (4)
  record/time/when
  character*20       why
  structure /person/ who
      character*10   name
  end structure
end structure
logical         app_flag 
end type

record /appointment/ tomorrow
record /time/ now

tomorrow.app_date = date(6, 17, 2014)
tomorrow.app_time(1) = time(15, 0)
tomorrow.app_time(2) = time(16, 0)
tomorrow.app_memo(1).when = now
tomorrow.app_memo(1).why = "Kill"
tomorrow.app_memo(2).when = now
tomorrow.app_memo(2).why = "fortran"
tomorrow.app_memo(3).when = now
tomorrow.app_memo(3).why = "with"
tomorrow.app_memo(4).when = now
tomorrow.app_memo(4).why = "fire"
tomorrow.app_flag = .true.

call assertbb("tomorrow.app_date.day",   tomorrow.app_date.day,   6_1)
call assertbb("tomorrow.app_date.month", tomorrow.app_date.month, 17_1)
call assertii("tomorrow.app_date.year",  tomorrow.app_date.year,  2014_2)
call assertbb("tomorrow.app_time(1).hour", tomorrow.app_time(1).hour, 15_1)
call assertbb("tomorrow.app_time(1).minute", tomorrow.app_time(1).minute, 0_1)
call assertbb("tomorrow.app_time(2).hour", tomorrow.app_time(2).hour, 16_1)
call assertbb("tomorrow.app_time(2).minute", tomorrow.app_time(2).minute, 0_1)
call assert  ("tomorrow.app_flag",       tomorrow.app_flag)

call assertss("tomorrow.app_memo(1).why", tomorrow.app_memo(1).why, "Kill")
call assertss("tomorrow.app_memo(2).why", tomorrow.app_memo(2).why, "fortran")
call assertss("tomorrow.app_memo(3).why", tomorrow.app_memo(3).why, "with")
call assertss("tomorrow.app_memo(4).why", tomorrow.app_memo(4).why, "fire")

end program
