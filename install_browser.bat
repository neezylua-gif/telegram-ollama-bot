@echo off
chcp 65001 >nul
cd /d "%~dp0"

if not exist .venv\Scripts\python.exe (
  echo Сначала один раз запустите run_bot.bat, чтобы создать .venv.
  pause
  exit /b 1
)

call .venv\Scripts\activate.bat
python -m playwright install chromium
if errorlevel 1 (
  echo.
  echo Не удалось установить Chromium.
  echo Можно использовать установленный Edge: WEBSITE_BROWSER_CHANNEL=msedge
  echo Или Chrome: WEBSITE_BROWSER_CHANNEL=chrome
  pause
  exit /b 1
)

echo ready> .playwright_chromium_ready
echo Chromium установлен.
pause
