MODULE core_lib
  USE, INTRINSIC :: ISO_C_BINDING, ONLY: C_INT
  IMPLICIT NONE

  ! Define the required integer types
  INTEGER, PARAMETER :: HID_T = C_INT
  INTEGER, PARAMETER :: HADDR_T = C_INT

  ! Define the token type
  TYPE :: H5O_TOKEN_T_F
    INTEGER(C_INT) :: token_id
  END TYPE H5O_TOKEN_T_F

  INTERFACE
     INTEGER(C_INT) FUNCTION H5VLnative_token_to_addr(loc_id, token, addr) BIND(C, NAME='H5VLnative_token_to_addr')
       IMPORT :: C_INT, HID_T, HADDR_T, H5O_TOKEN_T_F
       INTEGER(HID_T), VALUE :: loc_id
       TYPE(H5O_TOKEN_T_F), VALUE :: token
       INTEGER(HADDR_T) :: addr
     END FUNCTION H5VLnative_token_to_addr
  END INTERFACE

END MODULE core_lib
