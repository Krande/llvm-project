@echo off

:: if build dir does not exist create it
if not exist build mkdir build

set "LIBRARY_PREFIX=%CONDA_PREFIX%\Library"
echo "LIBRARY_PREFIX: %LIBRARY_PREFIX%"

set EXTRA_INCLUDE=%VCToolsInstallDir%\atlmfc\include

:: append extra include path

REM remove GL flag for now
set "CXXFLAGS=-MD /I\"%VCToolsInstallDir%atlmfc\include\""
set "CC=cl.exe"
set "CXX=cl.exe"


cmake -G Ninja -B build -S llvm ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreadedDLL ^
  -DCMAKE_CXX_STANDARD=17 ^
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ^
  -DLLVM_ENABLE_ASSERTIONS=ON ^
  -DLLVM_TARGETS_TO_BUILD=host ^
  -DLLVM_INCLUDE_BENCHMARKS=OFF ^
  -DLLVM_INCLUDE_DOCS=OFF ^
  -DLLVM_LIT_ARGS=-v ^
  -DLLVM_ENABLE_PROJECTS="clang;mlir;flang;openmp" ^
  -DLLVM_ENABLE_RUNTIMES="compiler-rt"


ninja -C build install