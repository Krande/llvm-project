@echo off

set THIS_DIR=%~dp0

:: Compile C function using MSVC (cl.exe) or Intel’s icx.exe
cl.exe /nologo /c %THIS_DIR%h5vl_native.c
if errorlevel 1 exit /b 1

flang-new %THIS_DIR%core_lib.F90 -o %THIS_DIR%core_lib.obj
flang-new %THIS_DIR%test_main.F90 -o %THIS_DIR%test_main.obj

if errorlevel 1 exit /b 1

:: Link all object files together
flang-new %THIS_DIR%test_main.obj %THIS_DIR%core_lib.obj %THIS_DIR%h5vl_native.obj -o

if errorlevel 1 exit /b 1

%THIS_DIR%test_value_bindc.exe

if errorlevel 1 exit /b 1
