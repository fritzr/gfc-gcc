      BF = f_eqt(F_OE, F_OA, F_TOL)
      CF = f_eqt(F_OE, F_OC, F_TOL)
      DF = f_eqt(F_OXE, F_OX, F_TOL)
      BD = d_eqt(D_OE, D_OA, D_TOL)
      CD = d_eqt(D_OE, D_OC, D_TOL)
      DD = d_eqt(D_OXE, D_OX, D_TOL)
      !BQ = q_eqt(Q_OE, Q_OA, Q_TOL)
      !CQ = q_eqt(Q_OE, Q_OC, Q_TOL)

      WRITE (E, '(F10.6)') F_OE
      WRITE (A, '(F10.6)') F_OA
      call fail_on_false(BF, "F ", E, A)
      WRITE (A, '(F10.6)') F_OC
      call fail_on_false(CF, "CF", E, A)
      WRITE (E, '(F10.6)') F_OXE
      WRITE (A, '(F10.6)') F_OX
      call fail_on_false(DF, "XF", E, A)

      WRITE (E, '(F10.6)') D_OE
      WRITE (A, '(F10.6)') D_OA
      call fail_on_false(BD, "D ", E, A)
      WRITE (A, '(F10.6)') D_OC
      call fail_on_false(CD, "CD", E, A)
      WRITE (E, '(F10.6)') D_OXE
      WRITE (A, '(F10.6)') D_OX
      call fail_on_false(DD, "XD", E, A)

      !WRITE (E, '(F10.6)') Q_OE
      !WRITE (A, '(F10.6)') Q_OA
      !call fail_on_false(BQ, "Q ", E, A)
      !WRITE (A, '(F10.6)') Q_OC
      !call fail_on_false(CQ, "CQ", E, A)
