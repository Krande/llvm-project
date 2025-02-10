MODULE fortran_interface
  USE, INTRINSIC :: ISO_C_BINDING, ONLY: C_INT
  IMPLICIT NONE

  INTERFACE
     INTEGER(C_INT) FUNCTION add_numbers(a, b) BIND(C, NAME="add_numbers")
       IMPORT :: C_INT
       INTEGER(C_INT), VALUE :: a, b
     END FUNCTION add_numbers
  END INTERFACE

END MODULE fortran_interface
