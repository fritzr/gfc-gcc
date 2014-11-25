! { dg-do compile }
! { dg-options "-fdec-structure" }
! This tests regressions for a bug where calling gfc_use_derived from
! gfc_find_component in build_struct caused the structure type symbol to be
! immediately switched out for the previously declared s0, freeing the actual
! type symbol being parsed.
!
! Apparently gfc_find_component is intended to be used only during resolution;
! the fix to this was to only call gfc_use_derived on FL_DERIVED type symbols.
! They should be completely parsed by the time gfc_find_component is used,
! whereas structure-like types aren't fully defined when they need to be used.
!

      subroutine sub0(a)
        structure /s0/
          union
            map
              real d
            end map
          end union
        end structure
        record /s0/ a

        a.d = 0
      end subroutine

      subroutine sub1()
        structure /s0/
          union
            map
              real d
            end map
          end union
        end structure
        record /s0/ a

        interface
          subroutine sub0 (a)
            structure /s0/
              union
                map
                  real d ! formerly gfc_use_derived here freed this s0 typesym
                end map
              end union
            end structure
            record /s0/ a
          end subroutine
        end interface

        call sub0(a)
      end subroutine

      program main
        call sub1()
      end
