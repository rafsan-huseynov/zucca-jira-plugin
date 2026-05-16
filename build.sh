#!/bin/bash

if [ ! -f .env ]; then
  echo "ERROR: .env file not found. Copy .env.example to .env and fill in your values."
  exit 1
fi

export $(grep -v '^#' .env | xargs)

if [ -z "$NGROK_URL" ]; then
  echo "ERROR: NGROK_URL is not set in .env"
  exit 1
fi

echo "Injecting NGROK_URL into manifest..."
sed "s|NGROK_URL_PLACEHOLDER|${NGROK_URL}/mcp|g" manifest.json > manifest.temp.json

mv manifest.json manifest.original.json
mv manifest.temp.json manifest.json

if [ ! -f color.png ]; then
  echo "Creating placeholder icons..."
  magick -size 192x192 xc:"#0052CC" color.png
  magick -size 32x32 xc:"#666666" outline.png
fi

rm -f zucca-jira-plugin.zip

echo "Packaging plugin..."
zip -r zucca-jira-plugin.zip manifest.json color.png outline.png skills/

mv manifest.original.json manifest.json

echo ""
echo "SUCCESS: zucca-jira-plugin.zip is ready!"
echo "Upload it at: https://admin.microsoft.com → Settings → Integrated apps"