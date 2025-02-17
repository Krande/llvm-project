@echo off

setlocal enabledelayedexpansion

set THIS_DIR=%~dp0
REM call %THIS_DIR%../activate_intel.bat

:: make directory for output files
if not exist %THIS_DIR%out mkdir %THIS_DIR%out

ifx.exe /nologo %THIS_DIR%cmake_kinds_check.F90 /o %THIS_DIR%out/cmake_kinds_check_ifx.exe

call %THIS_DIR%\out\cmake_kinds_check_ifx.exe

endlocal