@echo off
:: Ẩn cửa sổ cmd
if "%1" == "hidden" goto :main
start /B /MIN cmd /c %0 hidden & exit
:main

chcp 65001 >nul
title KHOI DONG HE THONG XEP HANG TTPVHCC FREE 1.0
color 0a
echo --------------------------------------------------------
echo  HE THONG XEP HANG TTPVHCC FREE 1.0 - DEV BY KYNCHOU
echo --------------------------------------------------------
echo.

:: Kiem tra file account.json
if not exist "config.json" (
    echo [LOI] File config.json khong ton tai!
    pause
    exit /b
)

:: Kiem tra dinh dang JSON
python -c "import json; json.load(open('config.json'))" 2>nul
if %errorlevel% neq 0 (
    echo [LOI] File config.json khong dung dinh dang JSON!
    pause
    exit /b
)

:: Khoi dong Flask va ghi PID vao file
echo.
echo Dang khoi dong ung dung...

:: Chay va ghi PID vao app.pid
start "" /B python run_app.py
:: Doi 1-2 giay cho tiến trình được khởi tạo
timeout /t 2 >nul

:: Ghi PID vao file app.pid (tien trinh python chay run_app.py)
for /f "tokens=2" %%a in ('tasklist /FI "IMAGENAME eq python.exe" /FI "WINDOWTITLE ne N/A" /FO LIST ^| findstr /i "PID"') do (
    echo %%a > app.pid
    echo PID: %%a da duoc luu vao app.pid
    goto done
)

:done
echo.
echo He thong da duoc khoi dong. Nhan Ctrl+C neu chay bang console.
echo.
pause
