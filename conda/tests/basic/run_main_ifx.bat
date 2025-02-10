@echo off

set THIS_DIR=%~dp0

:: Compile C function
cl.exe /nologo /c %THIS_DIR%c_functions.c

if errorlevel 1 exit /b 1
:: Compile Fortran files with Intel Fortran (IFX)
ifx /nologo /c %THIS_DIR%fortran_interface.F90

if errorlevel 1 exit /b 1
ifx /nologo /c %THIS_DIR%test_main.F90

if errorlevel 1 exit /b 1

:: Link everything together
ifx /nologo test_main.obj fortran_interface.obj c_functions.obj /link /NODEFAULTLIB:libucrt.lib ucrt.lib
if errorlevel 1 exit /b 1

:: Run the program
test_main.exe
if errorlevel 1 exit /b 1
