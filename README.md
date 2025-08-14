# Gemini CLI Assistant

A tiny Bash-powered assistant that lets you query **Google Gemini** from your terminal — no browser, no fuss.  
Works on any Linux machine. Highly aliasable for instant access (save those precious seconds).

> **Requirement:** `GEMINI_API_KEY` must be set in your environment.

---

## ✨ Features

- Chat with Gemini straight from your shell
- Single-file Bash script (`curl` + `jq` only)
- Supports multiline prompts, files/stdin piping
- Works anywhere Bash runs on Linux

---

 **Export your API key**  
   ```bash
   export GEMINI_API_KEY="YOUR_API_KEY"
