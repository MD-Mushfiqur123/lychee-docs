# CLI Reference

Lychee provides 24+ CLI commands for managing local LLMs.

## Core Commands

| Command | Description |
|---------|-------------|
| `lychee serve` | Start the Lychee server |
| `lychee run <model>` | Run a model interactively |
| `lychee pull <model>` | Pull a model from registry |
| `lychee push <model>` | Push a model to registry |
| `lychee create <name>` | Create a custom model |
| `lychee show <model>` | Show model details |
| `lychee list` | List local models |
| `lychee stop <model>` | Stop a running model |
| `lychee delete <model>` | Delete a model |

## HuggingFace Commands

| Command | Description |
|---------|-------------|
| `lychee hf pull <repo>` | Pull GGUF model from HF Hub |
| `lychee hf search <query>` | Search HF catalog |

## Developer Tools

| Command | Description |
|---------|-------------|
| `lychee compare <prompt> <model1> <model2>` | Benchmark models side-by-side |
| `lychee stats --tui` | Live performance dashboard |
| `lychee scan` | Hardware detection & recommendations |
| `lychee generate-client` | Generate SDK boilerplate |
| `lychee inspect <model>` | Inspect model internals |
| `lychee quantize <model>` | Quantize a model |
| `lychee embed <input>` | Generate embeddings |
| `lychee export <model>` | Export a model |
| `lychee copy <src> <dst>` | Copy a model |
| `lychee modelfile` | Show/create Modelfile |

## Agent Mode

| Command | Description |
|---------|-------------|
| `lychee run <model> --experimental` | Interactive agent with tool approval |
| `lychee agent` | Agent configuration |

## Configuration

| Command | Description |
|---------|-------------|
| `lychee config` | View/edit configuration |
| `lychee completion` | Generate shell completions |

## Common Flags

| Flag | Description |
|------|-------------|
| `--help` | Show help for command |
| `--verbose` | Enable verbose output |
| `--format` | Output format (json, text) |

For full details on any command:
```bash
lychee <command> --help
```
