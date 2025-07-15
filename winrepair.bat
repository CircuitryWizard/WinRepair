@echo off
chcp 65001 >nul
color 0A
>nul 2>&1 net session
if %errorlevel% neq 0 (
    echo Перезапуск від імені адміністратора...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:MENU
title Меню дій
cls
echo ========================================
echo             ВИБЕРІТЬ ОПЦІЮ:
echo ========================================
echo [1] Перевірка SFC
echo [2] Швидка перевірка DISM
echo [3] Повна перевірка DISM та відновлення
echo [4] Вийти з програми
echo [5] Перезавантажити комп'ютер
echo [6] Повна перевірка (SFC → DISM → SFC → DISM → Перезавантаження)
echo ========================================
choice /c 123456 /n /m "Натисніть клавішу 1, 2, 3, 4, 5 або 6: "

if %errorlevel%==1 goto SFC
if %errorlevel%==2 goto DISM
if %errorlevel%==3 goto DISM2
if %errorlevel%==4 goto EXIT
if %errorlevel%==5 goto REBOOT
if %errorlevel%==6 goto DEEPCLEAN

:SFC
title Перевірка SFC
cls
echo Запуск SFC (System File Checker)...
sfc /scannow
pause
timeout /t 1 >nul
goto MENU

:DISM
title Перевірка DISM
cls
echo Запуск DISM (CheckHealth)...
DISM /Online /Cleanup-Image /CheckHealth

echo ========================================
echo             ВИБЕРІТЬ ОПЦІЮ:
echo ========================================
echo [1] Повернутися у меню
echo [2] Повна перевірка та відновлення
echo ========================================
choice /c 12 /n /m "Натисніть клавішу 1 або 2: "

if %errorlevel%==1 goto MENU
if %errorlevel%==2 goto DISM2

:DISM2
title Відновлення DISM
cls
echo Запуск DISM (RestoreHealth)...
DISM /Online /Cleanup-Image /RestoreHealth

echo Перевірка завершена.
pause
timeout /t 1 >nul
goto MENU

:EXIT
title Завершення роботи
echo Завершення роботи.
timeout /t 2 >nul 
exit

:REBOOT
title Перезавантаження
echo Перезавантаження через 5 секунд...
timeout /t 5
shutdown /r /t 0
exit


:DEEPCLEAN
title Повна перевірка
cls
echo [1/4] SFC - первинна перевірка...
sfc /scannow

echo [2/4] DISM - RestoreHealth...
DISM /Online /Cleanup-Image /RestoreHealth

echo [3/4] SFC - контрольна перевірка...
sfc /scannow

echo [4/4] DISM - фіналізація...
DISM /Online /Cleanup-Image /RestoreHealth

echo Усі етапи завершено. Перезавантаження через 10 секунд...
timeout /t 10
shutdown /r /t 0
exit