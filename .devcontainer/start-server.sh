#!/bin/bash

# Simple script to start Jekyll development server in devcontainer
echo "🚀 Starting Spryker Docs development server..."
echo "📍 Server will be available at: http://localhost:4000"
echo "🔄 LiveReload will be available at: http://localhost:35729"
echo ""

bundle exec jekyll serve --host 0.0.0.0 --livereload --incremental --force_polling