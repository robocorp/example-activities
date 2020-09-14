@echo off

python -m robot -d output --logtitle "Task log" robot.robot || goto :error

echo Success
goto :EOF

:error
echo Failed with error %errorlevel%.
exit /b %errorlevel%
