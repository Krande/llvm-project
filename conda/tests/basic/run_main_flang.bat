@echo off

set THIS_DIR=%~dp0

:: Compile C function
cl.exe /nologo /c %THIS_DIR%c_functions.c -o c_functions.obj

if errorlevel 1 exit /b 1

:: Compile Fortran files with Flang-new
flang-new.exe -c %THIS_DIR%fortran_interface.F90 -o fortran_interface.obj

if errorlevel 1 exit /b 1
flang-new.exe -c %THIS_DIR%test_main.F90 -o test_main.obj

if errorlevel 1 exit /b 1

:: Link everything together
flang-new.exe test_main.obj fortran_interface.obj c_functions.obj -link
if errorlevel 1 exit /b 1

:: Run the program
test_main.exe
if errorlevel 1 exit /b 1
