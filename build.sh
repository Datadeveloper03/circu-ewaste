#!/usr/bin/env bash
# Exit on error
set -o errexit

echo "📦 Checking and building frontend assets..."
cd frontend
if npm ci || npm install; then
  npm run build || echo "⚠️ npm run build skipped or failed, falling back to pre-built out/ assets"
else
  echo "⚠️ npm install failed, falling back to pre-built out/ assets"
fi
cd ..

echo "🐍 Installing Python dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "✅ Build completed successfully!"
