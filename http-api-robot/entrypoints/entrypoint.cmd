@echo off

REM Writes log and report files to "output" directory.
python -m robot --report NONE --outputdir output --logtitle "Task log" tasks.robot || goto :error

echo Success
goto :EOF

:error
echo Failed with error %errorlevel%.
exit /b %errorlevel%
