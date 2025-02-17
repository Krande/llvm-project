PROGRAM FC08_AVAIL_KINDS
    USE, INTRINSIC :: ISO_FORTRAN_ENV, ONLY : stdout=>OUTPUT_UNIT, integer_kinds, real_kinds, logical_kinds
    IMPLICIT NONE
    INTEGER :: ik, jk, k, max_decimal_prec
    INTEGER :: num_rkinds, num_ikinds, num_lkinds

    ! Find integer KINDs

    num_ikinds = SIZE(integer_kinds)

    DO k = 1, num_ikinds
        WRITE(stdout,'(I0)', ADVANCE='NO') integer_kinds(k)
        IF(k.NE.num_ikinds)THEN
            WRITE(stdout,'(A)',ADVANCE='NO') ','
        ELSE
            WRITE(stdout,'()')
        ENDIF
    ENDDO

    ! Find real KINDs

    num_rkinds = SIZE(real_kinds)

    max_decimal_prec = 1

    prec: DO ik = 2, 36
        exp: DO jk = 1, 700
            k = SELECTED_REAL_KIND(ik,jk)
            IF(k.LT.0) EXIT exp
            max_decimal_prec = ik
        ENDDO exp
    ENDDO prec

    DO k = 1, num_rkinds
        WRITE(stdout,'(I0)', ADVANCE='NO') real_kinds(k)
        IF(k.NE.num_rkinds)THEN
            WRITE(stdout,'(A)',ADVANCE='NO') ','
        ELSE
            WRITE(stdout,'()')
        ENDIF
    ENDDO

    WRITE(stdout,'(I0)') max_decimal_prec
    WRITE(stdout,'(I0)') num_ikinds
    WRITE(stdout,'(I0)') num_rkinds

    ! Find logical KINDs

    num_lkinds = SIZE(logical_kinds)
    WRITE(stdout,'(I0)') num_lkinds

    DO k = 1, num_lkinds
        WRITE(stdout,'(I0)', ADVANCE='NO') logical_kinds(k)
        IF(k.NE.num_lkinds)THEN
            WRITE(stdout,'(A)',ADVANCE='NO') ','
        ELSE
            WRITE(stdout,'()')
        ENDIF
    ENDDO

END PROGRAM FC08_AVAIL_KINDS