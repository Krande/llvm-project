PROGRAM test_main
  USE fortran_interface
  IMPLICIT NONE

  INTEGER(C_INT) :: result
  INTEGER(C_INT) :: x, y

  ! Assign test values
  x = 5
  y = 10

  ! Call the C function
  result = add_numbers(x, y)

  ! Print the result
  PRINT *, "Sum of", x, "and", y, "is:", result

END PROGRAM test_main
