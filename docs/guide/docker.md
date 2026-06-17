# Docker

Run Lychee in a container with GPU acceleration support.

## Quick Start

```bash
# Build the image
docker build -t lychee https://github.com/MD-Mushfiqur123/lychee.git

# Run with persistent storage
docker run -d -v lychee:/root/.lychee -p 11434:11434 --name lychee lychee
```

## GPU Acceleration

### NVIDIA GPU (CUDA)

```bash
docker run -d --gpus all -v lychee:/root/.lychee -p 11434:11434 --name lychee lychee
```

### AMD GPU (ROCm)

```bash
docker run -d --device /dev/kfd --device /dev/dri -v lychee:/root/.lychee -p 11434:11434 --name lychee lychee
```

## Docker Compose

Create a `docker-compose.yml`:

```yaml
version: '3.8'
services:
  lychee:
    image: lychee:latest
    container_name: lychee
    ports:
      - "11434:11434"
    volumes:
      - lychee-data:/root/.lychee
    restart: unless-stopped
    # For NVIDIA GPU:
    # deploy:
    #   resources:
    #     reservations:
    #       devices:
    #         - driver: nvidia
    #           count: 1
    #           capabilities: [gpu]

volumes:
  lychee-data:
```

Then run:
```bash
docker compose up -d
```

## Build from Local Source

```bash
git clone https://github.com/MD-Mushfiqur123/lychee.git
cd lychee
docker build -t lychee .
```

## Multi-Instance Setup

Run multiple Lychee instances for load balancing:

```bash
# Instance 1 on port 11434
docker run -d -v lychee1:/root/.lychee -p 11434:11434 --name lychee1 lychee

# Instance 2 on port 11435
docker run -d -v lychee2:/root/.lychee -p 11435:11434 --name lychee2 lychee
```

Then configure the [Model Router](/guide/api#virtual-router-apiroutes) to distribute requests.
