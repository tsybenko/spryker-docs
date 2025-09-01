#!/bin/bash

# Spryker Docs Devcontainer Setup Script

echo "🚀 Setting up Spryker Docs development environment..."

# Install Ruby dependencies
echo "📦 Installing Ruby gems..."
bundle install --retry=3

# Install Node.js dependencies  
echo "📦 Installing Node.js packages..."
npm install

# Install additional tools
echo "🔧 Installing additional development tools..."

# Make sure Vale is executable
chmod +x vale/vale 2>/dev/null || echo "Vale binary not found, will use system version"

# Set up git configuration if not already set
if [ -z "$(git config --global user.name)" ]; then
    echo "⚙️  Setting up git configuration..."
    git config --global user.name "Developer"
    git config --global user.email "developer@example.com"
    echo "   You can change these with 'git config --global user.name \"Your Name\"'"
    echo "   and 'git config --global user.email \"your.email@example.com\"'"
fi

# Copy bash configuration
echo "🔧 Setting up shell configuration..."
cat /home/runner/work/spryker-docs/spryker-docs/.devcontainer/.bashrc >> ~/.bashrc

# Create a welcome script
cat > /usr/local/bin/spryker-docs-help << 'EOF'
#!/bin/bash
echo "🚀 Spryker Docs Development Environment"
echo ""
echo "Available commands:"
echo "  serve      - Start Jekyll development server"
echo "  build      - Build the Jekyll site"
echo "  clean      - Clean Jekyll build files"
echo "  lint-md    - Run markdownlint"
echo "  lint-prose - Run Vale prose linting"
echo "  lint-all   - Run all linting tools"
echo "  styles     - Build CSS styles with Gulp"
echo ""
echo "Jekyll will be available at: http://localhost:4000"
echo "LiveReload will be available at: http://localhost:35729"
echo ""
echo "For more help, see .devcontainer/README.md"
EOF

chmod +x /usr/local/bin/spryker-docs-help

echo "✅ Setup complete! Run 'spryker-docs-help' for available commands."
echo "🌐 Start development server with: bundle exec jekyll serve --host 0.0.0.0 --livereload"