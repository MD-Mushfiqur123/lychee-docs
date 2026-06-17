# HuggingFace Integration

Pull GGUF models directly from HuggingFace Hub with Lychee's `hf` command.

## Search for Models

```bash
# Search the catalog
lychee hf search llama

# Search for specific model types
lychee hf search mistral
```

## Pull a Model

```bash
# Download recommended quantization
lychee hf pull microsoft/Phi-3-mini-4k-instruct-gguf

# List available quantizations
lychee hf pull bartowski/Meta-Llama-3.1-8B-Instruct-GGUF --list

# Download specific quantization
lychee hf pull bartowski/Meta-Llama-3.1-8B-Instruct-GGUF --quant q5_k_m
```

## Features

- **Concurrent Downloads**: Multi-shard parallel downloading for maximum speed
- **Resume Support**: Interrupted downloads resume from where they stopped
- **SHA256 Verification**: Automatic integrity checking of downloaded files
- **Quantization Selection**: Choose from all available GGUF quantization variants
- **Catalog Search**: Search HuggingFace for GGUF models without leaving the CLI

## Model Format Support

Lychee's `hf pull` works with any GGUF-format model on HuggingFace. Look for repositories with:

- `*-gguf` suffix (e.g., `bartowski/Meta-Llama-3.1-8B-Instruct-GGUF`)
- Models from popular uploaders: `bartowski`, `TheBloke`, `MaziyarPanahi`, etc.

## After Pulling

Once downloaded, use the model like any other:

```bash
# Run the model
lychee run Phi-3-mini-4k-instruct

# Use via API
curl http://localhost:11434/api/chat \
  -H "Content-Type: application/json" \
  -d '{
    "model": "Phi-3-mini-4k-instruct",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Download fails | Check internet connection; retry resumes from last position |
| SHA256 mismatch | Delete the partial download and retry |
| Model not found | Verify repository name and GGUF format availability |
| Slow downloads | Ensure concurrent shard support is enabled |
