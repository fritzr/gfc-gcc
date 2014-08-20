      ! { dg-do run }
      ! { dg-options "-fdec-structure" }
      !
      ! Verify a structure containing a record.
      !
      include 'assert.inc'

      program main

      structure /person/ 
          character(20) name
          integer(1) age
      end structure

      structure /car/
          record /person/ owner
          character(10)   make
          character(10)   model
          integer(4)      year
      end structure

      record /person/ me
      record /car/ mycar

      me.name = "fritz"
      me.age = 21

      mycar.owner = me
      mycar.make = "volkswagen"
      mycar.model = "jetta"
      mycar.year = 2013

      call assertss ("me.name", me.name, "fritz")
      call assertbb ("me.age", me.age,  21_1)
      call assertss ("mycar.make", mycar.make,  "volkswagen")
      call assertss ("mycar.model", mycar.model, "jetta")
      call assertll ("mycar.year", mycar.year,  2013)

      end program
