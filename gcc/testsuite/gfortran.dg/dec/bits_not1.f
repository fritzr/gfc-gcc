      ! { dg-do run }
      ! { dg-options "-fdec-bitwise-ops" }
      !
      ! Test the use of logical operators as bitwise operators when they
      ! have integer arguments.
      !

      PROGRAM MAIN

      INTEGER*1 A, OP, FUNC, OP_C, FUNC_C, C

      A = 4
      C = -5
      
      OP     = .not. A
      FUNC   = not(A)
      OP_C   = .not. 4
      FUNC_C = not(4)

      IF (OP .NE. C .OR. OP .NE.FUNC .OR. 
     &    OP_C .NE. FUNC_C .OR. OP .NE. OP_C) THEN
        PRINT *, "FAIL!!!! exp: ", C
        PRINT *, "         op: ",   OP,   " func: ",   FUNC,
     &           "         op_c: ", OP_C, " func_c: ", FUNC_C
        call abort
      ENDIF

      END PROGRAM
