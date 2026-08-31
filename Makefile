# Makefile for Computer Vision Workspace

.PHONY: setup jupyter clean format run

# Variabel
VENV = .venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip

# 1. Setup environment dan install dependensi
setup:
	@echo "🛠️ Creating virtual environment and installing dependencies..."
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	@echo "✅ Setup complete! Jangan lupa jalankan: source $(VENV)/bin/activate"

# 2. Menjalankan Jupyter Notebook
jupyter:
	@echo "📓 Membuka Jupyter Notebook..."
	$(VENV)/bin/jupyter notebook

# 3. Menjalankan skrip Python utama (jika ada src/main.py)
run:
	@if [ -f src/main.py ]; then \
		echo "🚀 Menjalankan src/main.py..."; \
		$(PYTHON) src/main.py; \
	else \
		echo "❌ src/main.py tidak ditemukan. Buat file tersebut atau jalankan spesifik script secara manual."; \
	fi

# 4. Merapikan format kode dengan black (Python formatter)
format:
	@echo "✨ Memformat kode di folder src/..."
	$(PIP) install black
	$(VENV)/bin/black src/

# 5. Membersihkan cache python dan menghapus virtual environment (reset)
clean:
	@echo "🧹 Membersihkan cache dan menghapus .venv..."
	rm -rf $(VENV)
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	@echo "✅ Clean up selesai."
