      ! { dg-do run }
      ! { dg-options "-fdec-bitwise-ops" }
      !
      ! Test the use of logical operators as bitwise operators when they
      ! have integer arguments.
      !

      PROGRAM MAIN

      INTEGER*8 A, B, OP, FUNC, OP_C, FUNC_C, C

      A = 3
      B = 5
      C = 1
      
      OP     = A .and. B
      FUNC   = iand(A, B)
      OP_C   = 3 .and. 5
      FUNC_C = iand(3, 5)

      IF (OP .NE. C .OR. OP .NE.FUNC .OR. 
     &    OP_C .NE. FUNC_C .OR. OP .NE. OP_C) THEN
        PRINT *, "FAIL!!!! exp: ",  C
        PRINT *, "         op: ",   OP,   " func: ",   FUNC,
     &           "         op_c: ", OP_C, " func_c: ", FUNC_C
        call abort
      ENDIF

      END PROGRAM
