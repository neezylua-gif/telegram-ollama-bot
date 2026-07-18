@echo off
chcp 65001 >nul
cd /d "%~dp0"

if not exist .env (
  echo Файл .env не найден.
  echo Скопируйте .env.example в .env и заполните TELEGRAM_TOKEN и ADMIN_CHAT_ID.
  pause
  exit /b 1
)

if not exist .venv\Scripts\python.exe (
  echo Создание виртуального окружения...
  py -3.11 -m venv .venv
  if errorlevel 1 goto error
)

call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt
if errorlevel 1 goto error

if not exist .playwright_chromium_ready (
  echo.
  echo Установка Chromium для анализа внешнего вида сайтов...
  python -m playwright install chromium
  if errorlevel 1 (
    echo Chromium Playwright не установился. Бот попробует использовать Edge или Chrome.
  ) else (
    echo ready> .playwright_chromium_ready
  )
)

python bot.py
exit /b 0

:error
echo.
echo Запуск не удался. Проверьте сообщения выше.
pause
exit /b 1
