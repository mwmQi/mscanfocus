#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to print informational messages
info() {
    echo "[INFO] $1"
}

# Change to the script's directory to ensure relative paths work
cd "$(dirname "$0")"
info "Starting installation from $(pwd)..."

# 1. Check for pip and install python if it's missing
if ! command -v pip &> /dev/null; then
    info "pip not found, installing python..."
    pkg install -y python
    info "Python installed."
else
    info "pip is already installed."
fi

# 2. Install dependencies
info "Installing Python dependencies from requirements.txt..."
pip install -r requirements.txt
info "Dependencies installed successfully."

# 3. Copy the executable to the bin directory
INSTALL_DIR="/data/data/com.termux/files/usr/bin"
EXEC_NAME="mscan"
SOURCE_FILE="bin/mscanfocus"

info "Installing '$SOURCE_FILE' to '$INSTALL_DIR/$EXEC_NAME'..."

# Remove the destination file if it exists to prevent errors
if [ -e "$INSTALL_DIR/$EXEC_NAME" ]; then
    rm "$INSTALL_DIR/$EXEC_NAME"
    info "Removed existing file at '$INSTALL_DIR/$EXEC_NAME'."
fi

cp "$SOURCE_FILE" "$INSTALL_DIR/$EXEC_NAME"
info "Executable copied successfully."

# 4. Make the script executable
chmod +x "$INSTALL_DIR/$EXEC_NAME"
info "Set execute permission on '$INSTALL_DIR/$EXEC_NAME'."

echo
echo "[SUCCESS] Installation complete. You can now run 'mscan' from anywhere."

