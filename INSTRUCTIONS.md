# Panduan Penggunaan Comvis Workspace

File ini memuat panduan mendetail tentang cara menggunakan repository ini untuk mata kuliah Visi Komputer dan Pengolahan Citra Digital, termasuk alur Git, pemakaian Makefile, dan struktur penyimpanan file.

## 1. Setup Lingkungan Kerja (Virtual Environment)
Agar library komputer visi (seperti `opencv-python`) tidak bentrok dengan library global OS, kita menggunakan virtual environment (`.venv`). 

Untuk setup awal, cukup jalankan perintah berikut di terminal root proyek:
```bash
make setup
```
Perintah ini akan secara otomatis:
- Membuat folder `.venv/`
- Mengupdate `pip` ke versi terbaru
- Menginstal seluruh paket yang ada di `requirements.txt`

Setelah selesai, **selalu aktifkan venv** sebelum menjalankan kode apapun melalui terminal Anda:
```bash
source .venv/bin/activate
```
*(Ciri venv aktif: akan ada teks `(.venv)` di prompt terminal Anda).*

## 2. Menggunakan Makefile
Repository ini meminjam konsep C++ / `opengl-workspace` agar running script Python lebih praktis tanpa perintah yang panjang. Berikut command yang tersedia:

- `make setup`   : Instalasi awal environment (membuat .venv dan install reqs).
- `make jupyter` : Membuka Jupyter Notebook di browser Anda, langsung terhubung dengan environment proyek. Sangat disarankan untuk mengerjakan eksperimen (hands-on).
- `make run`     : Menjalankan file utama jika Anda memindahkan logika program ke `src/main.py`.
- `make format`  : Secara otomatis merapikan style kode (linting) di folder `src/` menggunakan pustaka `black`.
- `make clean`   : Menghapus folder virtual environment (`.venv`) serta file cache Python sementara (seperti `__pycache__` dan file `.pyc`). Gunakan ini jika ingin mereset dependensi proyek.

## 3. Git Workflow (Alur Kerja Cabang/Branch)
Agar rapi dan tidak mengotori template utama, repository ini menggunakan alur cabang (branching) berikut:

- **`main`**: Ini adalah **TEMPLATE**. Jangan bekerja langsung di branch ini. Branch ini hanya berisi struktur dasar.
- **`experiment/*`**: Gunakan awalan branch ini saat Anda melakukan hands-on di kelas atau sekadar menguji suatu algoritma.
  - *Contoh: `git checkout -b experiment/color-spaces`*
- **`task/*`**: Gunakan awalan ini untuk mengerjakan tugas praktikum, PR, atau proyek akhir matakuliah.
  - *Contoh: `git checkout -b task/assignment-1`*

**Workflow ketika ada tugas baru:**
1. Pastikan Anda berada di `main` dan mendapatkan versi terbaru:
   `git checkout main && git pull`
2. Buat branch baru untuk tugas tersebut:
   `git checkout -b task/nama-tugas`
3. Kerjakan kode di dalam `notebooks/` atau `src/`
4. Commit dan push branch tersebut.

## 4. Memisahkan Notebook dan Script (.py)
- Jika Anda masih meraba-raba (trial and error) dalam memproses gambar (seperti mencari parameter thresholding yang tepat), **selalu gunakan `notebooks/`**. Notebook memungkinkan gambar langsung terlihat di bawah baris kode Anda tanpa membuka banyak jendela baru.
- Jika logika algoritmanya sudah final dan butuh diterapkan untuk ratusan gambar secara otomatis, pindahkan ke file dengan format `.py` ke folder **`src/`**.
