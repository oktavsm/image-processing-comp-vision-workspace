# Comvis Workspace Instructions

This file contains a detailed guide on how to use this repository for the Computer Vision and Digital Image Processing course, including the Git workflow, Makefile usage, and file storage structure.

## 1. Setting Up the Workspace (Virtual Environment)
To prevent computer vision libraries (like `opencv-python`) from conflicting with global OS libraries, we use a virtual environment (`.venv`). 

For the initial setup, simply run the following command in the project root terminal:
```bash
make setup
```
This command will automatically:
- Create a `.venv/` folder
- Upgrade `pip` to the latest version
- Install all packages listed in `requirements.txt`

Once completed, **always activate the venv** before running any code via your terminal:
```bash
source .venv/bin/activate
```
*(Indicator of an active venv: you will see `(.venv)` in your terminal prompt).*

## 2. Using the Makefile
This repository borrows the C++ / `opengl-workspace` concept to make running Python scripts more practical without typing long commands. The following commands are available:

- `make setup`   : Initial environment installation (creates .venv and installs reqs).
- `make jupyter` : Opens Jupyter Notebook in your browser, directly connected to the project environment. Highly recommended for hands-on experiments.
- `make run`     : Runs the main file if you have moved your program logic to `src/main.py`.
- `make format`  : Automatically formats code style (linting) in the `src/` folder using the `black` library.
- `make stop`    : Stops any Jupyter Notebook processes running in the background.
- `make clean`   : Stops running services, removes the virtual environment folder (`.venv`), and deletes temporary Python cache files. Use this to completely reset the project.

## 3. Git Workflow (Branching)
To keep things organized and avoid cluttering the main template, this repository uses the following branching workflow:

- **`main`**: This is the **TEMPLATE**. Do not work directly on this branch. It only contains the base structure.
- **`experiment/*`**: Use this branch prefix when doing hands-on work in class or simply testing an algorithm.
  - *Example: `git checkout -b experiment/color-spaces`*
- **`task/*`**: Use this prefix for practicum assignments, homework, or the course final project.
  - *Example: `git checkout -b task/assignment-1`*

**Workflow for a new assignment:**
1. Make sure you are on `main` and pull the latest version (if using remote):
   `git checkout main && git pull`
2. Create a new branch for the task:
   `git checkout -b task/task-name`
3. Write your code inside `notebooks/` or `src/`
4. Commit and push the branch.

## 4. Separating Notebooks and Scripts (.py)
- If you are still experimenting (trial and error) in processing images (like finding the right thresholding parameters), **always use `notebooks/`**. Notebooks allow images to be displayed directly below your code blocks without opening multiple new windows.
- If the algorithm logic is finalized and needs to be applied to hundreds of images automatically, move the code into a `.py` file format in the **`src/`** folder.
