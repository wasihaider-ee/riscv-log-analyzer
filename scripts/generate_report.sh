#!/bin/bash
# Enable strict error handling
set -euo pipefail

OUTPUT_DIR="output"
REPORT_FILE="${OUTPUT_DIR}/summary_report.txt"

echo "Generating summary report..."

# Ensure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Initialize the report file with a header
echo "=====================================" > "$REPORT_FILE"
echo "  RISC-V Simulation Summary Report" >> "$REPORT_FILE"
echo "  Generated on: $(date)" >> "$REPORT_FILE"
echo "=====================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Loop through all log files in the test_data directory
for log_file in test_data/*.log; do
    echo "Processing $log_file..."
    
    echo "--- Results for $log_file ---" >> "$REPORT_FILE"
    
    # Run analyze.sh and append its output. 
    # The '|| true' prevents the loop from crashing if analyze.sh returns an exit code of 1 (which it will if a test fails)
    bash scripts/analyze.sh "$log_file" >> "$REPORT_FILE" || true
    
    echo -e "\n" >> "$REPORT_FILE"
done

echo "Report successfully generated at $REPORT_FILE"