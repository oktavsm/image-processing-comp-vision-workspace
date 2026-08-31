# 👁️ Computer Vision & Digital Image Processing Workspace

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![OpenCV](https://img.shields.io/badge/opencv-%23white.svg?style=for-the-badge&logo=opencv&logoColor=white)
![Jupyter Notebook](https://img.shields.io/badge/jupyter-%23FA0F00.svg?style=for-the-badge&logo=jupyter&logoColor=white)

This repository serves as the primary workspace for learning and completing assignments for the **Digital Image Processing (PCD) and Computer Vision** course.

The repository is designed to be modular, structured, and ready to use for experiments ranging from classic image processing to vision-based machine learning.

## 📂 Project Structure

```text
comvis-workspace/
├── assets/           # Raw datasets and sample/test images
├── notebooks/        # Exploration (EDA), hands-on, and interactive prototyping
├── src/              # Modular code (production-ready Python scripts)
│   ├── main.py       # (Optional) Main script entry point 
│   └── ...           # Utility scripts (filters, color conversions, etc.)
├── output/           # (Ignored) Directory to save output images/models
├── INSTRUCTIONS.md   # Technical guide on using the repository
├── Makefile          # Shortcut commands for easier execution
└── requirements.txt  # List of library dependencies (OpenCV, Numpy, Matplotlib, etc.)
```

## 🚀 Quick Start

This workspace includes a `Makefile` to simplify installation and initial setup. Make sure you have Python 3 installed on your system.

1. **Setup Virtual Environment & Dependencies**
   ```bash
   make setup
   ```
2. **Activate the Virtual Environment (Manual)**
   ```bash
   source .venv/bin/activate
   ```
3. **Start Experimenting (Launch Jupyter Notebook)**
   ```bash
   make jupyter
   ```

## 📖 Full Guide
Please read [INSTRUCTIONS.md](INSTRUCTIONS.md) for full details on the workflow (Git workflow), file management, and explanations of each command inside the `Makefile`.
