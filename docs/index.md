---
layout: home

hero:
  name: "Lychee"
  text: "Local LLM Orchestration"
  tagline: Drop-in upgrade for Ollama with multi-model pipelines, structured output, conversation memory, and load balancing.
  actions:
    - theme: brand
      text: Get Started
      link: /guide/getting-started
    - theme: alt
      text: View on GitHub
      link: https://github.com/MD-Mushfiqur123/lychee

features:
  - icon: 🔌
    title: Multi-Protocol API
    details: Anthropic Messages API, OpenAI Chat Completions, and OpenAI Responses API — all running locally with any model.
  - icon: 🤖
    title: Model Composer
    details: Chain multiple local models into DAG-based pipelines with conditional logic, parallel execution, and fallback models.
  - icon: 🛡️
    title: Structured Output
    details: JSON Schema validation with automatic retry and error-correction prompting for reliable structured data generation.
  - icon: 💾
    title: Conversation Memory
    details: Persistent SQLite-backed conversation storage. Save, resume, and delete conversations across sessions.
  - icon: 📥
    title: HuggingFace Integration
    details: Pull GGUF models directly from HuggingFace Hub with multi-shard concurrent downloads and SHA256 integrity verification.
  - icon: ⚖️
    title: Load Balancing
    details: Virtual model routing across multiple instances with round-robin, random, and least-loaded strategies.
  - icon: 🖥️
    title: Web Dashboard
    details: Embedded React SPA for chat, model management, and system monitoring — served directly from the binary.
  - icon: 📊
    title: Developer Tools
    details: Multi-model benchmarking, live performance dashboard, hardware scanning, and SDK code generation.
---
