	STRUCTURE /BUFFER/
	UNION
	 MAP
	  byte		bbuf(L_bbuf)
	 END MAP
	 MAP
	  character*8	abuf(L_bbuf/8)
	 END MAP
	 MAP
	  integer*2	ibuf(L_bbuf/2)
	 END MAP
	 MAP
	  integer*4	lbuf(L_bbuf/4)
	 END MAP
	 MAP
	  real*4	fbuf(L_bbuf/4)
	 END MAP
!if !_PFC
	 MAP
	  integer*8	xbuf(L_bbuf/8)
	 END MAP
!endif
	 MAP
	  real*8	dbuf(L_bbuf/8)
	 END MAP
	 MAP
	  complex*8	cfbuf(L_bbuf/8)
	 END MAP
	 MAP
	  complex*16	cdbuf(L_bbuf/16)
	 END MAP
	 MAP
!if _CNVX
!
!else
	  character*(L_bbuf)  sbuf		! Sun/OSF/SOL/IRIX Fortran
!endif
	 END MAP
	END UNION
	END STRUCTURE
