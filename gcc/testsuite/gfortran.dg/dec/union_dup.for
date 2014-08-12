! { dg-do compile }
! { dg-options "-fdec-structure" }
!
! Tests whether the compiler correctly complains when a member has been
! declared twice in unions, including a nested sense.
!

program main

structure /test/
  union

    map
      integer x
    end map

    map
      integer y

      union 

        map
          integer x ! { dg-error "already declared" }
        end map

        map
          structure y ! { dg-error "already declared" }
            integer*1 hour, minute 
          end structure 
        end map

      end union

    end map

  end union
end structure

end program main
