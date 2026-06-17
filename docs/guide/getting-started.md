# Getting Started

Lychee is a **drop-in upgrade** for [Ollama](https://github.com/ollama/ollama) — a local LLM runtime with enterprise-grade features built on top of the battle-tested Ollama inference engine.

## Installation

### go install (Recommended)

```bash
go install github.com/MD-Mushfiqur123/lychee@v0.1.1-alpha
```

This requires Go 1.22+.

### Build from Source

```bash
git clone https://github.com/MD-Mushfiqur123/lychee.git
cd lychee
go build -o lychee .
sudo mv lychee /usr/local/bin/  # Linux/macOS
```

### Docker

```bash
docker build -t lychee https://github.com/MD-Mushfiqur123/lychee.git
docker run -d -v lychee:/root/.lychee -p 11434:11434 --name lychee lychee
```

### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/MD-Mushfiqur123/lychee/main/scripts/install.ps1 | iex
```

## Quick Start

1. **Start the Lychee server**
   ```bash
   lychee serve
   ```

2. **Pull and run a model**
   ```bash
   lychee pull gemma3
   lychee run gemma3
   ```

3. **Interact via API**
   ```bash
   curl http://localhost:11434/v1/messages \
     -H "Content-Type: application/json" \
     -d '{
       "model": "gemma3",
       "messages": [{"role": "user", "content": "Hello!"}],
       "max_tokens": 1024
     }'
   ```

## What Lychee Adds

Lychee extends Ollama with five original features:

| Feature | Description |
|---------|-------------|
| **Model Composer** | Chain multiple models in DAG pipelines |
| **Structured Output** | JSON Schema validation with auto-retry |
| **Conversation Memory** | Persistent chat storage (SQLite) |
| **Load Balancing** | Virtual model routing across instances |
| **HuggingFace Hub** | Direct GGUF downloads with resume |

## Client SDKs

```bash
# Python
pip install lychee-python

# JavaScript
npm install lychee-js
```

## Next Steps

- [CLI Reference](/guide/cli) — All 24+ CLI commands
- [API Reference](/guide/api) — REST API endpoints
- [Docker Guide](/guide/docker) — Container deployment
- [HuggingFace Integration](/guide/huggingface) — Pull models from HF Hub
