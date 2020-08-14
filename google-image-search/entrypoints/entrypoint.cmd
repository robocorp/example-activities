@echo off

python -m robot --report NONE --outputdir output --logtitle "Task log" tasks || goto :error

echo Success
goto :EOF

:error
echo Failed with error %errorlevel%.
exit /b %errorlevel%
