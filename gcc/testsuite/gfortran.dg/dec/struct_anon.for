! { dg-do run }
! { dg-options "-fdec-structure" }
!
! Test anonymous ad-hoc structure components.
!
include 'assert.inc'

program main

structure /appointment/
structure time_start, time_end
  integer*1       hour, minute 
end structure 
logical         app_flag 
end structure

record /appointment/ tomorrow

tomorrow.time_start.hour = 15
tomorrow.time_start.minute = 0
tomorrow.time_end.hour = 16
tomorrow.time_end.minute = 0
tomorrow.app_flag = .true.

call assertbb ("time_start.hour", tomorrow.time_start.hour, 15_1)
call assertbb ("time_start.minute", tomorrow.time_start.minute, 0_1)
call assertbb ("time_end.hour", tomorrow.time_end.hour, 16_1)
call assertbb ("time_end.minute", tomorrow.time_end.minute, 0_1)
call assert   ("app_flag", tomorrow.app_flag)

end program
