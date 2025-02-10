@echo off

set THIS_DIR=%~dp0

flang-new %THIS_DIR%core_lib.F90 %THIS_DIR%test_main.F90 -o %THIS_DIR%test_value_bindc.exe

if errorlevel 1 exit /b 1

%THIS_DIR%test_value_bindc.exe

if errorlevel 1 exit /b 1
