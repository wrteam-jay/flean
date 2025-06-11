# flean - Flutter Clean Utility

A powerful command-line utility for cleaning multiple Flutter projects at once. `flean` helps you quickly clean build artifacts, caches, and generated files from your Flutter projects with an interactive selection interface.

## Features

- 🔍 **Smart Project Discovery** - Automatically finds all Flutter projects in a directory
- 🎯 **Interactive Selection** - Choose which projects to clean using a fuzzy finder interface
- 🧹 **Comprehensive Cleaning** - Removes build artifacts, Gradle cache, Kotlin cache, CocoaPods, and more
- 🌈 **Beautiful Interface** - Colored output with clear progress indicators
- ⚡ **Fast & Efficient** - Parallel cleaning with detailed feedback
- 🔧 **Easy Installation** - Automated dependency management

## What Gets Cleaned

`flean` performs a comprehensive clean that goes beyond `flutter clean`:

- **Flutter artifacts**: `.dart_tool`, build files
- **Android**: `.gradle`, `.kotlin`, `.cxx` directories
- **iOS**: `Pods`, `.symlinks`, build directories
- **Generated files**: All build and cache directories

## Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd flean
   ```

2. **Run the installer:**
   ```bash
   ./install.sh
   ```

The installer will automatically:
- Check for Homebrew (required for dependencies)
- Install missing dependencies (`fzf`, `fd`)
- Install the `flean` command to your system
- Update your shell configuration
- Verify the installation

## Requirements

- **macOS** (tested on macOS, may work on Linux)
- **Homebrew** - Package manager for macOS
- **Flutter** - Flutter SDK must be installed and in PATH
- **fzf** - Command-line fuzzy finder (auto-installed)
- **fd** - Fast alternative to find command (auto-installed)

## Usage

### Basic Usage

```bash
flean <directory>
```

### Examples

```bash
# Clean projects in your Development folder
flean ~/Development

# Clean projects in current directory
flean .

# Clean projects in a specific path
flean /path/to/flutter/projects
```

### Interactive Controls

When the project selection interface appears:

- **Tab/Shift+Tab** - Select/deselect projects
- **Ctrl+A** - Toggle selection for all projects
- **Ctrl+C** - Cancel the operation
- **Enter** - Start cleaning selected projects

### Getting Help

```bash
flean --help
# or
flean -h
```

## Example Output

```
🧹 Flutter Clean Tool (flean)
==============================

[INFO] Searching for Flutter projects in: ~/Development
[INFO] Cleaning 3 project(s)...

[INFO] Cleaning my_flutter_app...
[SUCCESS] Flutter clean completed
[SUCCESS] Cleaned my_flutter_app (5 additional items removed)

[INFO] Cleaning another_project...
[SUCCESS] Flutter clean completed
[SUCCESS] Cleaned another_project (4 additional items removed)

🎉 All selected projects have been cleaned!
```

## Troubleshooting

### Permission Issues
If you encounter permission errors, try running the installer with sudo:
```bash
sudo ./install.sh
```

### Missing Dependencies
If you see dependency errors, ensure Homebrew is installed:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Command Not Found
If `flean` command is not found after installation:
1. Restart your terminal
2. Or manually source your shell configuration:
   ```bash
   source ~/.zshrc  # for zsh
   source ~/.bashrc # for bash
   ```

### Flutter Not Found
Ensure Flutter is properly installed and in your PATH:
```bash
flutter doctor
```

## Shell Compatibility

The installer automatically detects your shell and updates the appropriate configuration file:
- **Zsh**: Updates `~/.zshrc`
- **Bash**: Updates `~/.bashrc` or `~/.bash_profile`
- **Other shells**: Updates `~/.profile`

## Contributing

Feel free to submit issues, feature requests, or pull requests to improve `flean`.

## License

This project is open source. Please check the repository for license details.

---

**Made with ❤️ for Flutter developers**
