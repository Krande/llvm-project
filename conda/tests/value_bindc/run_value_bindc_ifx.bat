@echo off

set THIS_DIR=%~dp0
echo "THIS_DIR: %THIS_DIR%"
echo "Running Intel Fortran LLVM IFX compiler"

:: Compile C function using MSVC (cl.exe) or Intel’s icx.exe
cl.exe /nologo /c %THIS_DIR%h5vl_native.c

if errorlevel 1 exit /b 1

:: Compile Fortran source files with IFX
ifx.exe /nologo /c %THIS_DIR%core_lib.F90

if errorlevel 1 exit /b 1
ifx.exe /nologo /c %THIS_DIR%test_main.F90

if errorlevel 1 exit /b 1

:: Link all object files together
ifx.exe /nologo test_main.obj core_lib.obj h5vl_native.obj /link /NODEFAULTLIB:libucrt.lib ucrt.lib

if errorlevel 1 exit /b 1

:: Run the program
%THIS_DIR%test_main.exe

if errorlevel 1 exit /b 1
