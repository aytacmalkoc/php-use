@echo off

REM Add C:\php-switcher folder to PATH (if not already added)
powershell -Command "$currentPath = [Environment]::GetEnvironmentVariable('Path', 'User'); if ($currentPath -notlike '*C:\php-switcher*') { $newPath = $currentPath + ';C:\php-switcher'; [Environment]::SetEnvironmentVariable('Path', $newPath, 'User'); Write-Host 'C:\php-switcher added to PATH.' } else { Write-Host 'C:\php-switcher is already in PATH.' }"

SET PHP_73=C:\laragon\bin\php\php-7.3.33-nts-Win32-VC15-x64
SET PHP_82=C:\laragon\bin\php\php-8.2.27-nts-Win32-vs16-x64
SET PHP_83=C:\laragon\bin\php\php-8.3.26-Win32-vs16-x64
SET PHP_84=C:\laragon\bin\php\php-8.4.14-nts-Win32-vs17-x64

IF "%1"=="8.2" (
    SETX PHP_PATH "%PHP_82%"
    echo Switched to PHP 8.2
) ELSE IF "%1"=="8.3" (
    SETX PHP_PATH "%PHP_83%"
    echo Switched to PHP 8.3
) ELSE IF "%1"=="8.4" (
    SETX PHP_PATH "%PHP_84%"
    echo Switched to PHP 8.4
) ELSE IF "%1"=="7.3" (
    SETX PHP_PATH "%PHP_73%"
    echo Switched to PHP 7.3
) ELSE (
    echo Please specify a version number like 8.2, 8.3, or 8.4.
    echo Usage: php-use.bat [version]
)
