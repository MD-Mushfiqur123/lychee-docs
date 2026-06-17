# API Reference

Lychee provides a multi-protocol API gateway supporting native Lychee, OpenAI, and Anthropic endpoints.

## API Endpoints

| Endpoint | Protocol | Description |
|----------|----------|-------------|
| `/api/chat` | Lychee Native | Multi-turn chat with streaming |
| `/api/generate` | Lychee Native | Single generation with options |
| `/api/structured` | Lychee Native | JSON Schema-validated output |
| `/api/compose` | Lychee Native | Multi-model pipeline execution |
| `/api/conversations` | Lychee Native | Persistent conversation memory |
| `/api/routes` | Lychee Native | Virtual model routing |
| `/v1/chat/completions` | OpenAI | Chat completions API |
| `/v1/messages` | Anthropic | Messages API |
| `/v1/responses` | OpenAI Responses | Structured responses |

## Anthropic Messages API (`/v1/messages`)

Drop-in replacement for the Anthropic SDK:

```python
from anthropic import Anthropic

client = Anthropic(
    base_url="http://localhost:11434/v1",
    api_key="lychee-local"
)

message = client.messages.create(
    model="gemma3",
    max_tokens=1000,
    messages=[
        {"role": "user", "content": "Explain quantum computing."}
    ]
)
print(message.content[0].text)
```

## OpenAI Chat Completions (`/v1/chat/completions`)

```bash
curl http://localhost:11434/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gemma3",
    "messages": [
      {"role": "system", "content": "You are a helpful assistant."},
      {"role": "user", "content": "Hello!"}
    ]
  }'
```

## Structured Output (`/api/structured`)

```bash
curl http://localhost:11434/api/structured \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gemma3",
    "prompt": "Extract: Jane Doe, 28, engineer",
    "schema": {
      "type": "object",
      "properties": {
        "name": {"type": "string"},
        "age": {"type": "integer"},
        "occupation": {"type": "string"}
      },
      "required": ["name", "age", "occupation"]
    },
    "max_retries": 3
  }'
```

## Model Composer (`/api/compose`)

```bash
curl http://localhost:11434/api/compose \
  -H "Content-Type: application/json" \
  -d '{
    "input": "Life is like a box of chocolates.",
    "steps": [
      {
        "model": "gemma3",
        "prompt": "Translate to French: {{input}}"
      },
      {
        "model": "phi3",
        "prompt": "Explain meaning: {{step[0].output}}"
      }
    ]
  }'
```

## Virtual Router (`/api/routes`)

```bash
curl http://localhost:11434/api/routes \
  -H "Content-Type: application/json" \
  -d '{
    "name": "fast-route",
    "endpoints": [
      {"host": "http://localhost:11434", "model": "gemma3", "weight": 2},
      {"host": "http://localhost:11435", "model": "phi3", "weight": 1}
    ],
    "strategy": "weighted_round_robin"
  }'
```

## Client SDKs

### Python

```bash
pip install lychee-python
```

```python
from lychee import Lychee

client = Lychee(base_url="http://localhost:11434")
response = client.chat.create(
    model="gemma3",
    messages=[{"role": "user", "content": "Hello!"}]
)
```

### JavaScript

```bash
npm install lychee-js
```

```javascript
import { Lychee } from 'lychee-js';

const client = new Lychee({ baseUrl: 'http://localhost:11434' });
const response = await client.chat.create({
  model: 'gemma3',
  messages: [{ role: 'user', content: 'Hello!' }]
});
```
