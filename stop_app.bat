@echo off
chcp 65001 >nul
title DUNG HE THONG XEP HANG TTPVHCC 1.0
color 0c
echo --------------------------------------------------------
echo  DUNG HE THONG XEP HANG TTPVHCC 1.0 - DEV BY KYNCHOU
echo --------------------------------------------------------
echo.

:: Kiem tra file PID
if not exist app.pid (
    echo [LOI] Khong tim thay file app.pid. Chua khoi dong hoac da bi xoa.
    pause
    exit /b
)

set /p PID=<app.pid
echo PID can dung: %PID%

:: Kiem tra tien trinh co ton tai
tasklist /FI "PID eq %PID%" | find "%PID%" >nul
if errorlevel 1 (
    echo [LOI] Khong tim thay tien trinh voi PID %PID%
    del app.pid >nul 2>&1
    pause
    exit /b
)

:: Dung tien trinh
echo Dang dung tien trinh %PID%...
taskkill /PID %PID% /F >nul 2>&1

if %errorlevel% equ 0 (
    echo [OK] Da dung tien trinh thanh cong.
    del app.pid >nul 2>&1
) else (
    echo [LOI] Khong the dung tien trinh.
)

echo.
pause
