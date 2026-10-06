# Detailed Command Reference

## 1. analyze.sh
The core analysis script located at `scripts/analyze.sh`.

**Syntax:**
`./scripts/analyze.sh <log_file> [options]`

**Arguments:**
* `$1`: Path to the log file (Required)
* `--format [text/csv]`: Set the output format (Default: text)
* `--output <path>`: Specify an output file path (Default: stdout)
* `--verbose`: Enable detailed verbose output
* `--help`: Print usage instructions

## 2. Makefile Targets
The project uses `make` to automate common tasks.

* `make all`: Runs setup, tests, and generates reports.
* `make test`: Runs the analyzer on all log files in `test_data/` and verifies output.
* `make report`: Generates a summary text report inside the `output/` directory.
* `make setup`: Checks that all required OS tools (awk, grep, sed, etc.) are installed.
* `make clean`: Deletes all generated files in the `output/` directory.
* `make help`: Prints all available targets and descriptions.