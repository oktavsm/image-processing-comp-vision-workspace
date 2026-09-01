# Makefile for Computer Vision Workspace

.PHONY: help setup jupyter run format stop clean experiment task

# Variables
VENV = .venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip

# 0. Help (Default target)
help:
	@echo "================================================================"
	@echo " 👁️  Computer Vision & Digital Image Processing Workspace 👁️ "
	@echo "================================================================"
	@echo "Available commands:"
	@echo "  make help         - Show this help message"
	@echo "  make setup        - Create virtual environment and install dependencies"
	@echo "  make jupyter      - Open Jupyter Notebook"
	@echo "  make run          - Run src/main.py"
	@echo "  make format       - Format code using black"
	@echo "  make stop         - Stop Jupyter Notebook services"
	@echo "  make clean        - Remove virtual environment and cached files"
	@echo "----------------------------------------------------------------"
	@echo "Branching Commands:"
	@echo "  make experiment NAME=<name> - Create a new experiment branch from main"
	@echo "                                Example: make experiment NAME=test-sift"
	@echo "  make task NAME=<name>       - Create a new task branch from main"
	@echo "                                Example: make task NAME=hw-1"
	@echo "================================================================"

# 1. Setup environment and install dependencies
setup:
	@echo "🛠️ Creating virtual environment and installing dependencies..."
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	@echo "✅ Setup complete! Do not forget to run: source $(VENV)/bin/activate"

# 2. Run Jupyter Notebook
jupyter:
	@echo "📓 Opening Jupyter Notebook..."
	$(VENV)/bin/jupyter notebook

# 3. Run main Python script (if src/main.py exists)
run:
	@if [ -f src/main.py ]; then \
		echo "🚀 Running src/main.py..."; \
		$(PYTHON) src/main.py; \
	else \
		echo "❌ src/main.py not found. Please create the file or run a specific script manually."; \
	fi

# 4. Format code using black (Python formatter)
format:
	@echo "✨ Formatting code in src/ directory..."
	$(PIP) install black
	$(VENV)/bin/black src/

# 5. Stop running services (e.g., Jupyter Notebook)
stop:
	@echo "🛑 Stopping Jupyter Notebook services..."
	@-pkill -f "jupyter" || true
	@echo "✅ All services stopped."

# 6. Clean python cache and remove virtual environment (reset)
clean: stop
	@echo "🧹 Cleaning cache and removing .venv..."
	rm -rf $(VENV)
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	@echo "✅ Clean up complete."

# 7. Create a new experiment branch
experiment:
	@if [ -z "$(NAME)" ]; then echo "❌ Error: Please provide a name, e.g., make experiment NAME=my-exp"; exit 1; fi
	@echo "🌿 Creating experiment/$(NAME) from main..."
	git checkout main
	git pull origin main || true
	git checkout -b experiment/$(NAME)
	@echo "✅ Switched to new branch: experiment/$(NAME)"

# 8. Create a new task branch
task:
	@if [ -z "$(NAME)" ]; then echo "❌ Error: Please provide a name, e.g., make task NAME=hw1"; exit 1; fi
	@echo "🌿 Creating task/$(NAME) from main..."
	git checkout main
	git pull origin main || true
	git checkout -b task/$(NAME)
	@echo "✅ Switched to new branch: task/$(NAME)"
