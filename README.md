# flean

> A command-line tool for cleaning multiple Flutter projects at once

Stop running `flutter clean` on each project individually. `flean` automatically finds all Flutter projects in a directory and lets you select which ones to clean with an interactive interface.

## Quick Start

```bash
# Install
git clone https://github.com/YOUR_USERNAME/flean.git
cd flean
./install.sh

# Use
flean ~/Development
```

## Features

- **Find all Flutter projects** in a directory automatically
- **Interactive selection** with fuzzy search (powered by fzf)
- **Deep clean** - removes more than `flutter clean` alone
- **Batch operations** - clean multiple projects at once
- **Colored output** with progress indicators

## What Gets Cleaned

Goes beyond `flutter clean` by removing:

- `.dart_tool` and build directories
- `android/.gradle` and `android/.kotlin`
- `android/app/.cxx`
- `ios/Pods` and `ios/.symlinks`

## Installation

**Requirements:** macOS with Homebrew (Linux should work but untested)

The installer handles everything:
```bash
./install.sh
```

It will:
- Check for required tools (Flutter, Homebrew)
- Install `fzf` and `fd` if needed
- Add `flean` to your PATH
- Configure your shell

After installation, restart your terminal or run:
```bash
source ~/.zshrc  # or ~/.bashrc for bash
```

## Usage

```bash
flean <directory>              # Clean projects in directory
flean .                        # Clean projects in current directory
flean ~/Development            # Clean all projects in Development folder
```

**Interactive controls:**
- `Tab` / `Shift+Tab` - Select/deselect projects
- `Ctrl+A` - Select all
- `Enter` - Start cleaning
- `Ctrl+C` - Cancel

## Example

```
🧹 Flutter Clean Tool (flean)
==============================

[INFO] Searching for Flutter projects in: ~/Development
[INFO] Cleaning 2 project(s)...

[INFO] Cleaning my_app...
[SUCCESS] Flutter clean completed
[SUCCESS] Cleaned my_app (5 additional items removed)

🎉 All selected projects have been cleaned!
```

## Troubleshooting

**Command not found after install?**
Restart your terminal or run `source ~/.zshrc`

**Missing dependencies?**
The installer should handle this, but you can manually install:
```bash
brew install fzf fd
```

**Permission errors?**
Try: `sudo ./install.sh`

## Why?

If you work with multiple Flutter projects, you know the pain:
- Build caches pile up and eat disk space
- Need to cd into each project to run `flutter clean`
- `flutter clean` doesn't remove everything (Gradle/Kotlin caches, Pods, etc.)

`flean` solves all of this in one command.

## Contributing

Issues and PRs welcome!

## License

MIT - see [LICENSE](LICENSE) file for details
