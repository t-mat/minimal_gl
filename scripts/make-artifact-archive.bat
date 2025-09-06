@echo off && setlocal EnableDelayedExpansion

:
set /a _E =0 &&   set "_P=Build"
:
set /a _E+=1 &&   call "%~dp0make-release-archive.bat" || goto :ERROR
set /a _E+=1 &&   if not exist "artifacts" ( mkdir artifacts )                        || goto :ERROR
set /a _E+=1 &&   copy *.zip artifacts                                                || goto :ERROR

echo !_ESC![2K %~n0 : Status =!_ESC![92m OK !_ESC![0m
set /a errorno=0
goto :END

:ERROR
echo !_ESC![2K %~n0 : Status =!_ESC![92m ERROR !_ESC![0m, _P=!_P!, _E=!_E!

:END
exit /B %errorno%
