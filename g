#!/bin/bash

MODEL="${GEMINI_MODEL:-gemini-2.0-flash}"
API_KEY="$GEMINI_API_KEY"

if [ -z "$API_KEY" ]; then
  echo "GEMINI_API_KEY not set"
  exit 1
fi

PRE_PROMPT="You are assisting a Linux user on Fedora Workstation using i3 and NVIDIA Optimus. Your tone should be focused, direct, and minimal. If available provide code snippets or commands with explanations, if available give links to installers or snippets of commands to install"
USER_PROMPT="$*"

RESPONSE=$(curl -s "https://generativelanguage.googleapis.com/v1beta/models/$MODEL:generateContent?key=$API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "contents": [
      {
        "role": "user",
        "parts": [{"text": "'"${PRE_PROMPT//\"/\\\"}"'"}]
      },
      {
        "role": "user",
        "parts": [{"text": "'"${USER_PROMPT//\"/\\\"}"'"}]
      }
    ]
  }')

TEXT=$(echo "$RESPONSE" | jq -r '.candidates[0].content.parts[0].text // empty')

if [ -z "$TEXT" ]; then
  echo "Gemini API error:"
  echo "$RESPONSE" | jq
else
  echo "$TEXT"
fi
