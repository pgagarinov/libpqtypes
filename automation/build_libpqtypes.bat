@echo off
:: Builds libpqtypes libraries
::
:: Set the path to the local Visual C++ installation in the variable below

setlocal EnableDelayedExpansion
:: Visual C++ installation directory
set msvcDefaultDir=C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\
set msvcDir=%~1
if "%msvcDir%"=="" set msvcDir=!msvcDefaultDir!
set sourceDir=%~dp0source\
set win32Dir=%~dp0win32\
set win64Dir=%~dp0win64\
set curPath=%PATH%
set curDir=%cd%

if not exist "%sourceDir%" (
	echo Source directory not found
	exist /b 1
)

:: find the latest version of libpq
for /d %%d in (%~dp0..\..\libpq\*) do set libpqDir=%%d

cd "%sourceDir%"

echo Building 32-bit libpqtypes
call "%msvcDir%\vcvarsall.bat" x86
nmake -f win32.mak clean
nmake -f win32.mak INC="-I%libpqDir%\include" LPATH="%libpqDir%\win32" all
if not exist "%win32Dir%" mkdir "%win32Dir%"
copy /Y *.lib "%win32Dir%"
copy /Y *.dll "%win32Dir%"
set PATH=%curPath%

echo Building 64-bit libpqtypes
call "%msvcDir%\vcvarsall.bat" x64
nmake -f win32.mak clean
nmake -f win32.mak INC="-I%libpqDir%\include" LPATH="%libpqDir%\win64" all
if not exist "%win64Dir%" mkdir "%win64Dir%"
copy /Y *.lib "%win64Dir%"
copy /Y *.dll "%win64Dir%"

cd "%curDir%"
