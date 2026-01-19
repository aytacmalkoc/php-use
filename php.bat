@echo off
REM PHP wrapper for Windows Command Prompt
REM Reads PHP_PATH from user environment variable and executes php.exe
FOR /F "tokens=*" %%i IN ('powershell -command "[System.Environment]::GetEnvironmentVariable('PHP_PATH','User')"') DO SET PHP_PATH=%%i
"%PHP_PATH%\php.exe" %*