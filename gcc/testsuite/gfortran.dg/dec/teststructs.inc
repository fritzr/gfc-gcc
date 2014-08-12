      IMPLICIT NONE
      STRUCTURE /T1/
        UNION
        MAP
        INTEGER*4 I
        END MAP
        MAP
        INTEGER*2 IH
        INTEGER*2 IL
        END MAP
        END UNION
        INTEGER*4 IT1
      END STRUCTURE

      STRUCTURE /T2/
        UNION
        MAP
        INTEGER*4 J
        END MAP
        MAP
        INTEGER*2 JH
        INTEGER*2 JL
        END MAP
        END UNION
        INTEGER*4 IT2
      END STRUCTURE
