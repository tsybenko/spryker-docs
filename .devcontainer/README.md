# Spryker Docs Development Container

This directory contains the VS Code Dev Container configuration for the Spryker Documentation project.

## What's Included

- **Ruby 3.2.2** with Jekyll 4.2.0 and all required gems
- **Node.js and npm** for frontend tooling (Gulp, Sass, etc.)
- **Development tools**: Vale (prose linting), markdownlint (markdown linting)
- **VS Code extensions** for Jekyll, Ruby, Markdown, and documentation editing
- **Port forwarding** for Jekyll dev server (4000) and LiveReload (35729)
- **Automated setup** via post-create command

## Getting Started

1. **Prerequisites:**
   - Install [VS Code](https://code.visualstudio.com/)
   - Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
   - Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. **Opening the project:**
   - Open this repository in VS Code
   - When prompted, click "Reopen in Container" (or use Command Palette > "Dev Containers: Reopen in Container")
   - Wait for the container to build and start (first run may take several minutes)
   - Dependencies will be automatically installed via the setup script

3. **Start developing:**
   - Use the Command Palette (Ctrl+Shift+P / Cmd+Shift+P) > "Tasks: Run Task" > "Jekyll: Serve"
   - Or run `.devcontainer/start-server.sh` in the terminal
   - Open http://localhost:4000 to view the site

## Available Commands & Tasks

### Quick Start Script
- `.devcontainer/start-server.sh` - Start Jekyll development server

### VS Code Tasks (Ctrl+Shift+P > "Tasks: Run Task")
- **Jekyll: Serve** - Start development server with live reload (default build task)
- **Jekyll: Build** - Build the static site
- **Jekyll: Clean** - Clean build files
- **Lint: Markdown** - Run markdownlint on all markdown files
- **Lint: Vale** - Run Vale prose linting
- **Build: Styles** - Build CSS styles with Gulp

### Terminal Aliases (available after container setup)
- `serve` - Start Jekyll development server
- `build` - Build the Jekyll site
- `clean` - Clean Jekyll build files  
- `lint-md` - Run markdownlint
- `lint-prose` - Run Vale prose linting
- `lint-all` - Run all linting tools
- `styles` - Build CSS styles with Gulp

## Development Workflow

1. **Start the server**: Use the "Jekyll: Serve" task or run `serve` in terminal
2. **Edit content**: Modify markdown files in the `docs/` directory
3. **View changes**: Open http://localhost:4000 - changes auto-reload
4. **Lint content**: Use "Lint: Markdown" and "Lint: Vale" tasks before committing
5. **Style changes**: If you modify SCSS files, run "Build: Styles" task

## VS Code Extensions

The devcontainer automatically installs extensions for:

- **Jekyll/Liquid**: Template editing and syntax highlighting
- **Ruby**: Language support and debugging
- **Markdown**: Enhanced editing, preview, and linting
- **Documentation**: Vale integration, spell checking
- **Development**: Git graph, JSON editing, auto-completion

## Project Structure

```
├── .devcontainer/           # Dev container configuration
│   ├── devcontainer.json   # Main devcontainer config
│   ├── setup.sh           # Post-create setup script
│   ├── start-server.sh    # Quick start script
│   ├── tasks.json         # VS Code tasks
│   └── README.md          # This file
├── docs/                  # Documentation content
├── _includes/             # Jekyll includes
├── _layouts/              # Jekyll layouts
├── docker/                # Docker configuration
├── vale/                  # Vale prose linting rules
└── ...
```

## Port Configuration

- **4000**: Jekyll development server (auto-opens in browser)
- **35729**: LiveReload server for automatic page refresh

## Troubleshooting

### Container won't start
1. Ensure Docker Desktop is running
2. Try rebuilding: Command Palette > "Dev Containers: Rebuild Container"
3. Check Docker has enough memory allocated (recommend 4GB+)

### Bundle/Gem issues
1. Open terminal in VS Code
2. Run `bundle install --redownload`
3. If still failing, try `bundle clean --force && bundle install`

### Node/NPM issues
1. Run `npm ci` to clean install packages
2. If permission issues, run `npm cache clean --force`

### Port conflicts
1. Check if ports 4000 or 35729 are in use: `lsof -i :4000`
2. Stop other Jekyll instances or change ports in `_config.yml`

### Vale/Linting issues
1. Ensure Vale binary is executable: `chmod +x vale/vale`
2. Check Vale config: `vale --config=.vale.ini --version`

### Performance issues
1. Try running Jekyll with: `bundle exec jekyll serve --incremental`
2. Exclude large directories in `_config.yml`
3. Increase Docker Desktop memory allocation

### Need to reset environment
1. Command Palette > "Dev Containers: Rebuild Container Without Cache"
2. This will rebuild from scratch (takes longer but resolves most issues)

## Manual Setup (if automation fails)

If the automated setup doesn't work, run these commands manually in the container terminal:

```bash
# Install dependencies
bundle install
npm install

# Set up git (if needed)
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Start development server
bundle exec jekyll serve --host 0.0.0.0 --livereload
```

## Contributing

When contributing to the devcontainer configuration:

1. Test changes thoroughly
2. Update this README if you add new features
3. Ensure the setup script remains idempotent
4. Keep VS Code extension list minimal and relevant