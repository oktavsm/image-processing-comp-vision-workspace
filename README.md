# Computer Vision & Digital Image Processing Workspace

Template workspace untuk matakuliah Pengolahan Citra Digital (PCD) dan Visi Komputer (Computer Vision).

## Struktur Direktori
- `assets/`: Folder untuk menyimpan dataset gambar uji coba.
- `notebooks/`: Folder untuk Jupyter Notebook (sangat disarankan untuk eksperimen visual).
- `src/`: Folder untuk source code Python (.py) modular.
- `tests/`: Folder untuk unit tests.

## Setup Environment (VSCode)
1. Buka folder ini di VSCode.
2. Buat virtual environment: `python3 -m venv .venv`
3. Aktifkan virtual environment:
   - Linux/Mac: `source .venv/bin/activate`
   - Windows: `.venv\Scripts\activate`
4. Install dependencies: `pip install -r requirements.txt`

## Git Workflow
- `main`: Branch template project (clean state).
- `experiment/*`: Branch untuk eksperimen dan coba-coba (hands-on).
- `task/*`: Branch khusus untuk mengerjakan tugas/project.
