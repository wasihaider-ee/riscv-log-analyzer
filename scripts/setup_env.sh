#!/bin/bash
# Strict error handling
set -euo pipefail

echo "Checking environment for required tools..."

# Array of tools required for the riscv-log-analyzer project
REQUIRED_TOOLS=("bash" "grep" "awk" "sed" "sort" "wc")

MISSING_TOOLS=0

# Loop through each tool and check if it exists
for tool in "${REQUIRED_TOOLS[@]}"; do
    if command -v "$tool" &> /dev/null; then
        echo "[OK] $tool is installed."
    else
        echo "[ERROR] $tool is missing!"
        MISSING_TOOLS=$((MISSING_TOOLS + 1))
    fi
done

# Check if necessary directories exist
for dir in test_data output scripts docs; do
    if [ ! -d "$dir" ]; then
        echo "[WARNING] Directory '$dir' is missing! Creating it now..."
        mkdir -p "$dir"
    fi
done

# Exit with an error code if any tools are missing
if [ "$MISSING_TOOLS" -gt 0 ]; then
    echo "Environment check failed! Missing $MISSING_TOOLS required tool(s)."
    exit 1
else
    echo "Environment setup complete. All required tools are available."
    exit 0
fi