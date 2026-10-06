# Variables
SCRIPT = scripts/analyze.sh
TEST_DIR = test_data
OUTPUT_DIR = output

.PHONY: all test report clean help setup

all: setup test report

setup:
	@echo "Checking required tools..."
	bash scripts/setup_env.sh

test:
	@echo "Running analyzer on test logs..."
	bash $(SCRIPT) $(TEST_DIR)/sample_pass.log
	bash $(SCRIPT) $(TEST_DIR)/sample_fail.log
	bash $(SCRIPT) $(TEST_DIR)/sample_sim.log

report:
	@echo "Generating summary report..."
	bash scripts/generate_report.sh

clean:
	@echo "Cleaning output directory..."
	rm -rf $(OUTPUT_DIR)/*

help:
	@echo "Available targets:"
	@echo "  all    : Run setup, tests, and generate reports"
	@echo "  setup  : Check that required tools are installed"
	@echo "  test   : Run the analyzer on all test data files"
	@echo "  report : Generate a summary report in output/"
	@echo "  clean  : Remove all generated output files"
