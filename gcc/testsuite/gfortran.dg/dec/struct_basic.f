      ! { dg-do run }
      ! { dg-options "-fdec-structure" }
      !
      ! Test basic semantics of the STRUCTURE extension.
      !
      include 'assert.inc'

      program main

      ! Declaring a structure named ``item'' and containing three fields:
      ! an integer ID, an description string and a floating-point price.
      STRUCTURE /item/
        INTEGER id
        LOGICAL expensive
        CHARACTER(LEN=200) description
        REAL price
      END STRUCTURE

      ! Equivalent to:
      !TYPE item
      !  INTEGER id
      !  LOGICAL expensive
      !  CHARACTER(LEN=200) description
      !  REAL price
      !END TYPE

      ! Define two variables, an single record of type ``item''
      ! named ``pear'', and an array of items named ``store_catalog''
      RECORD /item/ pear, store_catalog(100)
      ! equivalent to:
      !TYPE(item) pear, store_catalog(100)

      ! We can directly access the fields of both variables
      pear.id = 92316
      pear.description = "juicy D'Anjou pear"
      pear.price = 0.15
      pear.expensive = .FALSE.
      store_catalog(7).id = 7831
      store_catalog(7).description = "milk bottle"
      store_catalog(7).price = 1.2

      ! Instead of using a dot (.) to access fields of a record, the
      ! standard syntax uses a percent sign (%)
      !pear%id = 92316
      !pear%description = "juicy D'Anjou pear"
      !pear%price = 0.15
      !store_catalog(7)%id = 7831
      !store_catalog(7)%description = "milk bottle"
      !store_catalog(7)%price = 1.2

      ! Assignments of a whole variable do not change
      store_catalog(12) = pear

      call assertll ("pear.id", pear%id, 92316)
      call assertrr ("pear.price", pear%price, 0.15)
      call assertll ("store_catalog(7).id", store_catalog(7)%id, 7831)
      call assertrr ("store_catalog(7).price", store_catalog(7)%price,
     & 1.2)

      end program main
