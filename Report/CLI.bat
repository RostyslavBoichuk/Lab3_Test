@echo off
CHCP 65001 > nul
title API Test Runner - Newman Automation

echo ===================================================
echo   REST API COMPLEX TESTING SUITE
echo ===================================================
echo.

:: Check if Newman is installed
where newman >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Newman is not installed! 
    echo Please run: npm install -g newman
    pause
    exit /b
)

echo [1/3] Cleaning up previous reports...
if exist report.html del /f /q report.html

echo [2/3] Executing Newman (CLI + HTML Reports)...
echo.

:: CORE EXECUTION COMMAND WITH RELATIVE PATHS
:: ..\Data\env.json means "go up one folder, then into Data"
call newman run "collection.json" ^
    -e "..\Data\env.json" ^
    -d "..\Data\test_data.json" ^
    -r cli,htmlextra ^
    --reporter-htmlextra-template "template.hbs" ^
    --reporter-htmlextra-export "report.html" ^
    --reporter-htmlextra-title "API Lab Report - JSONPlaceholder"

echo.
echo [3/3] Execution Finished!
echo ===================================================
echo Report File: report.html
echo.

:: Automatically open the report in the default browser
if exist report.html (
    echo Opening the HTML report...
    start report.html
) else (
    echo [WARNING] Report file was not generated. Check for errors above.
)

echo.
echo Press any key to exit...
pause > nul
echo.
echo Press any key to exit...
pause > nul