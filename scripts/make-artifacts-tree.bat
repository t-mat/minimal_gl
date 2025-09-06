@echo off && setlocal EnableDelayedExpansion
for /F "delims=#" %%E in ('"prompt #$E# & for %%E in (1) do rem"') do set "_ESC=%%E"

call "%~dp0build.bat" || goto :ERROR

if exist "artifacts" ( rmdir /S /Q artifacts 2>nul )
mkdir     artifacts 					|| goto :ERROR
mkdir     artifacts\examples 				|| goto :ERROR
copy x64\Release\minimal_gl.exe artifacts\		|| goto :ERROR
copy examples\*.*               artifacts\examples	|| goto :ERROR

echo !_ESC![2K %~n0 : Status =!_ESC![92m OK !_ESC![0m
set /a errorno=0
goto :END

:ERROR
echo !_ESC![2K %~n0 : Status =!_ESC![92m ERROR !_ESC![0m, _P=!_P!, _E=!_E!

:END
exit /B %errorno%
