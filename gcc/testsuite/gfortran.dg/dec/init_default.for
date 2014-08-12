! { dg-do run }
! { dg-options "-finit-local-zero -finit-derived" }
!
! Test -finit-derived with a component with a default initialization.
!
include 'assert.inc'

PROGRAM MAIN 

TYPE REPORT
  CHARACTER (LEN=20) REPORT_NAME
  INTEGER DAY
  CHARACTER (LEN=3) MONTH
  INTEGER :: YEAR = 1995 ! Only component with default
END TYPE REPORT ! initialization

TYPE (REPORT) :: SEP_REPORT
TYPE (REPORT), PARAMETER :: NOV_REPORT = REPORT ("Sales", 15, "NOV", 1996)
SEP_REPORT%MONTH = "SEP"
SEP_REPORT%REPORT_NAME = "Sept sales"

call assertll ("sep_report%year", sep_report%year, 1995)
call assertll ("sep_report%day", sep_report%day, 0)
call assertll ("nov_report%year", nov_report%year, 1996)

END PROGRAM
