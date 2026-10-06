# RISC-V Log Analyzer

## Description
A shell-based command-line tool that processes RISC-V simulation log files, extracts test results, calculates execution time statistics, and generates summary reports.

## Installation
1. Clone the repository: `git clone <your-repo-link>`
2. Navigate to the project: `cd riscv-log-analyzer`
3. Verify required tools (bash, grep, awk) are installed: `make setup`

## Usage Examples
Run the analyzer on a specific log file:
`./scripts/analyze.sh test_data/sample_fail.log`

Generate a full report for all logs in the `test_data/` directory:
`make report`

## Sample Output
=== RISC-V Simulation Log Analysis ===
Log file: test_data/sample_fail.log
Analysis date: 2026-05-05 14:30:00

--- Results Summary ---
Total tests: 25
Passed: 22 (88.0%)
Failed: 2 (8.0%)
Skipped: 1 (4.0%)

--- Failed Tests ---
1. rv32i-sll
2. rv32i-beq

--- Timing Statistics ---
Min time: 0.42s (rv32i-nop)
Max time: 2.31s (rv32i-mul)
Avg time: 0.87s

Verdict: FAIL
Exit code: 1