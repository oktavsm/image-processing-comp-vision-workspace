# Makefile for Computer Vision Workspace

.PHONY: setup jupyter run format stop clean

# Variables
VENV = .venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip

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
