! { dg-do compile }
! { dg-options "-fdec-extended-int" }
!
! Test the DEC extended integer format 'base#value' in a kind
! literal.
!
program main
integer(kind=2#100) :: i ! 100 in base 2 => 4
integer*3#11 j           ! 11  in base 3 => 4 
integer(5#13) k          ! 13  in base 5 => 8
end program main
