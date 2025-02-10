PROGRAM test_main
  USE core_lib
  IMPLICIT NONE

  INTEGER(HID_T) :: loc_id
  TYPE(H5O_TOKEN_T_F) :: token
  INTEGER(HADDR_T) :: addr
  INTEGER(C_INT) :: result

  ! Initialize test values
  loc_id = 1
  token%token_id = 42
  addr = 0

  ! Call the function
  result = H5VLnative_token_to_addr(loc_id, token, addr)

  ! Print the results
  PRINT *, "H5VLnative_token_to_addr result:", result
  PRINT *, "Address:", addr

END PROGRAM test_main
