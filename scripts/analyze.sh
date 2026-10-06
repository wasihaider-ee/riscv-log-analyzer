#!/bin/bash
# Safety first: exit on error, undefined vars, and pipe failures
set -euo pipefail

# Default variables
FORMAT="text"
OUTPUT_FILE="/dev/stdout"
VERBOSE=0

# Function 1: Print usage
print_usage() {
    echo "Usage: $0 <log_file> [--format text/csv] [--output <path>] [--verbose] [--help]"
}

# Function 2: Parse log file
analyze_log() {
    local file=$1
    
    # Example logic using grep and awk to extract data
    local total_tests=$(grep -c "TEST START" "$file" || true)
    local passed=$(grep -c "TEST PASS" "$file" || true)
    local failed=$(grep -c "TEST FAIL" "$file" || true)
    
    echo "=== RISC-V Simulation Log Analysis ==="
    echo "Log file: $file"
    echo "Total tests: $total_tests"
    echo "Passed: $passed"
    echo "Failed: $failed"
    
    # Calculate percentages
    local pass_percentage=0
    local fail_percentage=0
    if [ "$total_tests" -gt 0 ]; then
        pass_percentage=$((passed * 100 / total_tests))
        fail_percentage=$((failed * 100 / total_tests))
    fi
    
    echo "Pass Percentage: $pass_percentage%"
    echo "Fail Percentage: $fail_percentage%"
    
    if [ "$failed" -gt 0 ]; then
        return 1
    fi
    return 0
}

# Argument Parsing
if [ $# -lt 1 ]; then
    print_usage
    exit 1
fi

LOG_FILE=$1
shift

while [ $# -gt 0 ]; do
    case "$1" in
        --format) FORMAT=$2; shift 2 ;;
        --output) OUTPUT_FILE=$2; shift 2 ;;
        --verbose) VERBOSE=1; shift 1 ;;
        --help) print_usage; exit 0 ;;
        *) echo "Unknown option: $1"; print_usage; exit 1 ;;
    esac
done

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found!"
    exit 1
fi

if [ "$VERBOSE" -eq 1 ]; then
    echo "Starting analysis for $LOG_FILE..."
fi

# Run the analysis
analyze_log "$LOG_FILE" > "$OUTPUT_FILE"