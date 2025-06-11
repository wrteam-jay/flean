#!/bin/bash
# Author: Jay Parmar

# Colors for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

SCRIPT_PATH='flean'
INSTALL_DIR='/usr/local/bin'  # Changed to more standard location

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Homebrew is installed
check_homebrew() {
    if ! command -v brew >/dev/null 2>&1; then
        print_error "Homebrew is not installed!"
        echo "Please install Homebrew first by running:"
        echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
        echo "Then run this installer again."
        exit 1
    fi
    print_success "Homebrew is installed"
}

# Install dependencies automatically
install_dependencies() {
    print_status "Checking and installing dependencies..."
    
    # Check and install fzf
    if ! command -v fzf >/dev/null 2>&1; then
        print_status "Installing fzf..."
        if brew install fzf; then
            print_success "fzf installed successfully"
        else
            print_error "Failed to install fzf"
            exit 1
        fi
    else
        print_success "fzf is already installed"
    fi
    
    # Check and install fd
    if ! command -v fd >/dev/null 2>&1; then
        print_status "Installing fd..."
        if brew install fd; then
            print_success "fd installed successfully"
        else
            print_error "Failed to install fd"
            exit 1
        fi
    else
        print_success "fd is already installed"
    fi
    
    # Check Flutter
    if ! command -v flutter >/dev/null 2>&1; then
        print_warning "Flutter is not installed or not in PATH"
        print_warning "Please ensure Flutter is installed and available in your PATH"
        echo "Visit: https://docs.flutter.dev/get-started/install"
        read -p "Do you want to continue anyway? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    else
        print_success "Flutter is installed"
    fi
}

# Check if script is running with appropriate permissions
check_permissions() {
    if [ ! -w "$INSTALL_DIR" ] && [ "$(id -u)" -ne 0 ]; then
        print_error "Permission denied to write to $INSTALL_DIR"
        print_status "Trying to install with sudo..."
        
        # Re-run with sudo
        if command -v sudo >/dev/null 2>&1; then
            exec sudo "$0" "$@"
        else
            print_error "sudo is not available. Please run as administrator or choose a different install directory."
            exit 1
        fi
    fi
}

# Install the script
install_script() {
    print_status "Installing flean script..."
    
    # Check if script file exists
    if [ ! -f "$SCRIPT_PATH" ]; then
        print_error "Script file '$SCRIPT_PATH' not found in current directory"
        exit 1
    fi
    
    # Create install directory if it doesn't exist
    if [ ! -d "$INSTALL_DIR" ]; then
        print_status "Creating install directory: $INSTALL_DIR"
        mkdir -p "$INSTALL_DIR"
    fi
    
    # Copy script and set permissions
    if cp "$SCRIPT_PATH" "$INSTALL_DIR/"; then
        chmod +x "$INSTALL_DIR/$SCRIPT_PATH"
        print_success "Script installed to $INSTALL_DIR/$SCRIPT_PATH"
    else
        print_error "Failed to copy script to $INSTALL_DIR"
        exit 1
    fi
}

# Check and update PATH
update_path() {
    # Check if install directory is in PATH
    if echo "$PATH" | grep -q "$INSTALL_DIR"; then
        print_success "$INSTALL_DIR is already in PATH"
        return
    fi
    
    print_status "Adding $INSTALL_DIR to PATH..."
    
    # Detect shell and update appropriate config file
    if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ] || [ "$SHELL" = "/usr/bin/zsh" ]; then
        SHELL_CONFIG="$HOME/.zshrc"
    elif [ -n "$BASH_VERSION" ] || [ "$SHELL" = "/bin/bash" ] || [ "$SHELL" = "/usr/bin/bash" ]; then
        SHELL_CONFIG="$HOME/.bashrc"
        [ -f "$HOME/.bash_profile" ] && SHELL_CONFIG="$HOME/.bash_profile"
    else
        SHELL_CONFIG="$HOME/.profile"
    fi
    
    # Add to PATH
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$SHELL_CONFIG"
    print_success "Added $INSTALL_DIR to PATH in $SHELL_CONFIG"
    print_warning "Please restart your terminal or run: source $SHELL_CONFIG"
}

# Test installation
test_installation() {
    print_status "Testing installation..."
    
    if [ -x "$INSTALL_DIR/$SCRIPT_PATH" ]; then
        print_success "Installation test passed"
        echo
        print_success "🎉 flean has been successfully installed!"
        echo
        echo "Usage: flean <directory>"
        echo "Example: flean ~/Development"
        echo
        echo "Controls:"
        echo "  • Use Tab/Shift+Tab to select/deselect projects"
        echo "  • Use Ctrl+A to toggle all"
        echo "  • Use Ctrl+C to cancel"
        echo
        if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
            print_warning "⚠️  Please restart your terminal or run: source $SHELL_CONFIG"
        else
            print_status "You can now use 'flean' command from anywhere!"
        fi
    else
        print_error "Installation test failed"
        exit 1
    fi
}

# Main installation process
main() {
    echo "🧹 Flutter Clean Tool (flean) Installer"
    echo "======================================"
    echo
    
    check_homebrew
    install_dependencies
    check_permissions
    install_script
    update_path
    test_installation
}

# Run main function
main "$@"
