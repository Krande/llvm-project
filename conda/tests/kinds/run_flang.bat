@echo off

setlocal enabledelayedexpansion

set THIS_DIR=%~dp0
:: make directory for output files
if not exist %THIS_DIR%out mkdir %THIS_DIR%out

flang-new.exe %THIS_DIR%cmake_kinds_check.F90 -o %THIS_DIR%out/cmake_kinds_check.exe

call %THIS_DIR%out\kinds_check.exe

endlocal