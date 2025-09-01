# Spryker Docs Development Environment

# Aliases for common Jekyll tasks
alias serve='bundle exec jekyll serve --host 0.0.0.0 --incremental --livereload --force_polling'
alias build='bundle exec jekyll build'
alias clean='bundle exec jekyll clean'

# Aliases for linting and validation
alias lint-md='markdownlint-cli2 "**/*.md" "!node_modules" "!vendor"'
alias lint-prose='vale .'
alias lint-all='lint-md && lint-prose'

# Aliases for build tools
alias styles='npm run build'
alias watch='gulp watch'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# Display helpful information
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