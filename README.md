# 👁️ Computer Vision & Digital Image Processing Workspace

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![OpenCV](https://img.shields.io/badge/opencv-%23white.svg?style=for-the-badge&logo=opencv&logoColor=white)
![Jupyter Notebook](https://img.shields.io/badge/jupyter-%23FA0F00.svg?style=for-the-badge&logo=jupyter&logoColor=white)

Repositori ini adalah *workspace* utama untuk pembelajaran dan pengerjaan tugas mata kuliah **Pengolahan Citra Digital (PCD) dan Visi Komputer (Computer Vision)**.

Repositori ini didesain agar modular, terstruktur, dan siap digunakan untuk eksperimen pengolahan citra klasik hingga machine learning berbasis visi.

## 📂 Struktur Proyek

```text
comvis-workspace/
├── assets/           # Dataset gambar mentah dan gambar sampel/uji coba
├── notebooks/        # Eksplorasi (EDA), hands-on, dan prototyping interaktif
├── src/              # Kode modular (Python scripts yang siap di-run/produksi)
│   ├── main.py       # (Opsional) Entry point utama script 
│   └── ...           # Script utilitas (filter, konversi warna, dll)
├── output/           # (Di-ignore) Tempat menyimpan hasil gambar/model
├── INSTRUCTIONS.md   # Panduan teknis penggunaan repository
├── Makefile          # Shortcut command untuk mempermudah eksekusi
└── requirements.txt  # Daftar dependensi library (OpenCV, Numpy, Matplotlib, dll)
```

## 🚀 Quick Start

Workspace ini dilengkapi dengan `Makefile` untuk mempermudah instalasi dan setup awal. Pastikan Anda memiliki Python 3 terinstal di sistem.

1. **Setup Lingkungan Virtual & Dependensi**
   ```bash
   make setup
   ```
2. **Aktifkan Lingkungan Virtual (Manual)**
   ```bash
   source .venv/bin/activate
   ```
3. **Mulai Eksperimen (Buka Jupyter Notebook)**
   ```bash
   make jupyter
   ```

## 📖 Panduan Lengkap
Silakan baca [INSTRUCTIONS.md](INSTRUCTIONS.md) untuk detail lengkap mengenai alur kerja (Git workflow), manajemen file, dan penjelasan masing-masing fungsi yang ada di dalam `Makefile`.
