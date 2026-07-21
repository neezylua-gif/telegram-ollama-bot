## Telegram Bot with Ollama

## Description

Telegram bot that integrates with local Ollama instance for text generation, image analysis, and website content processing. All operations are performed locally without external API calls.

## Requirements

- Python 3.11 or higher
- Ollama server
- 8GB VRAM recommended

## Required Models
```bash
ollama pull qwen2.5-coder:7b
ollama pull qwen3-vl:4b
```

## Installation

1. Clone repository
2. Install Python dependencies:
`pip install -r requirements.txt`
3. Install Playwright browser:
`python -m playwright install chromium`
4. Copy `.env.example` to `.env` and configure:
- TELEGRAM_TOKEN - your bot token
- ADMIN_CHAT_ID - your Telegram ID

## Running the Bot

Windows:
run_bot.bat


Linux/Mac:
python bot.py


## Features

- Text generation and code synthesis
- Image recognition and analysis
- Document processing (PDF, DOCX, TXT, PY, JSON, YAML, MD)
- Website content extraction
- Static HTML/CSS/JS page reproduction
- Conversation history per user
- Administrative tools

## Commands

| Command | Description |
|---------|-------------|
| /start | Initialize bot |
| /reset | Clear conversation context |
| /status | Check Ollama status |

## Security

- SSRF protection against local network access
- Port restrictions (HTTP/HTTPS only)
- Redirect validation
- File size limits

## Limitations

- Website reproduction creates static demos only
- No backend, authentication, or payment processing
- Dynamic content may not be fully replicated
- Interactive forms are disabled

## Configuration

Environment variables in `.env`:

| Variable | Description | Default |
|----------|-------------|---------|
| TELEGRAM_TOKEN | Bot token | Required |
| ADMIN_CHAT_ID | Admin ID | Required |
| TEXT_MODEL | Text model | qwen2.5-coder:7b |
| VISION_MODEL | Vision model | qwen3-vl:4b |
| OLLAMA_BASE_URL | Ollama URL | http://127.0.0.1:11434 |

## Dependencies

- aiogram - Telegram API
- httpx - HTTP client
- beautifulsoup4 - HTML parsing
- Pillow - Image processing
- pypdf - PDF parsing
- python-docx - DOCX parsing
- playwright - Browser automation

## License

MIT License

