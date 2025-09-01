#!/bin/bash

# Devcontainer validation script
echo "🔍 Validating Spryker Docs devcontainer configuration..."

# Check if running in a container
if [ -f /.dockerenv ]; then
    echo "✅ Running in Docker container"
else
    echo "⚠️  Not running in Docker container (testing locally)"
fi

# Check working directory
if [ "$(pwd)" = "/usr/src/app" ] || [ "$(basename "$(pwd)")" = "spryker-docs" ]; then
    echo "✅ Working directory is correct"
else
    echo "⚠️  Working directory: $(pwd)"
fi

# Check if bundler is available
if command -v bundle &> /dev/null; then
    echo "✅ Bundler is available"
    bundle --version
else
    echo "❌ Bundler not found"
fi

# Check if npm is available
if command -v npm &> /dev/null; then
    echo "✅ NPM is available"
    npm --version
else
    echo "❌ NPM not found"
fi

# Check if git is available
if command -v git &> /dev/null; then
    echo "✅ Git is available"
    git --version
else
    echo "❌ Git not found"
fi

# Check key project files
echo ""
echo "📁 Checking project files..."
for file in "Gemfile" "package.json" "_config.yml" "docker-compose.yml"; do
    if [ -f "$file" ]; then
        echo "✅ $file exists"
    else
        echo "❌ $file missing"
    fi
done

# Check devcontainer files
echo ""
echo "🐳 Checking devcontainer files..."
for file in ".devcontainer/devcontainer.json" ".devcontainer/setup.sh" ".devcontainer/tasks.json"; do
    if [ -f "$file" ]; then
        echo "✅ $file exists"
    else
        echo "❌ $file missing"
    fi
done

# Test Jekyll availability
echo ""
echo "🌐 Testing Jekyll..."
if bundle exec jekyll --version &> /dev/null; then
    echo "✅ Jekyll is available via bundle"
    bundle exec jekyll --version
else
    echo "❌ Jekyll not available via bundle"
fi

# Test linting tools
echo ""
echo "🔍 Testing linting tools..."
if command -v vale &> /dev/null; then
    echo "✅ Vale is available"
else
    echo "⚠️  Vale not found in PATH (may be in vale/)"
fi

if command -v markdownlint-cli2 &> /dev/null; then
    echo "✅ markdownlint-cli2 is available"
else
    echo "⚠️  markdownlint-cli2 not found (install via npm)"
fi

echo ""
echo "🎉 Validation complete!"