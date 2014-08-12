      ! { dg-do run }
      ! { dg-options "-fdec-bitwise-ops" }
      !
      ! Test the use of logical operators as bitwise operators when they
      ! have integer arguments.
      !

      PROGRAM MAIN

      INTEGER*4 A, B, OP, FUNC, OP_C, FUNC_C, C

      A = 3
      B = 5
      C = 6
      
      OP     = A .neqv. B
      FUNC   = ieor(A, B)
      OP_C   = 3 .neqv. 5
      FUNC_C = ieor(3, 5)

      IF (OP .NE. C .OR. OP .NE.FUNC .OR. 
     &    OP_C .NE. FUNC_C .OR. OP .NE. OP_C) THEN
        PRINT *, "FAIL!!!! exp: ",  C
        PRINT *, "         op: ",   OP,   " func: ",   FUNC,
     &           "         op_c: ", OP_C, " func_c: ", FUNC_C
        call abort
      ENDIF

      END PROGRAM
