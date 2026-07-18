@echo off
chcp 65001 >nul
echo Проверка Ollama...
ollama --version
if errorlevel 1 (
  echo.
  echo Ollama не найдена. Сначала установите Ollama и перезапустите этот файл.
  pause
  exit /b 1
)

echo.
echo Загрузка текстовой модели...
ollama pull qwen2.5-coder:7b
if errorlevel 1 goto error

echo.
echo Загрузка модели распознавания изображений...
ollama pull qwen3-vl:4b
if errorlevel 1 goto error

echo.
echo Модели установлены.
ollama list
pause
exit /b 0

:error
echo.
echo Произошла ошибка при загрузке модели.
pause
exit /b 1
