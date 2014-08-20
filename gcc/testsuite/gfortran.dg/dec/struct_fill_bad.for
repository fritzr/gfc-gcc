      ! { dg-do compile }
      ! { dg-options "-fdec-structure" }
      !
      ! Test error handling for %FILL
      !
      program main

      structure /s/
        integer*2 i /3/
        integer*2 %fill /4/ ! { dg-error "Unnamed field.*initializer" }
        integer*2, pointer :: %fill ! { dg-error "Unnamed field.*attribute" }
      end structure

      type t
        integer %fill ! { dg-error "Unnamed field.*allowed" }
      endtype

      end program
