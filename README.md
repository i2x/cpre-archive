# CPRE Archive

A full-stack document storage system built with **Django** (backend) and **Vue 3 + Vite** (frontend).

## 📂 Project Structure
```
📦 cpre-archive
├── 📁 frontend   # Vue 3 + Vite frontend
├── 📁 backend    # Django backend
└── 📄 Makefile   # Automation commands
```

## 🚀 Getting Started

```sh
# 1️⃣ Clone the Repository
git clone --recursive https://github.com/i2x/cpre-archive.git
cd cpre-archive

# 2️⃣ Initialize and Update Submodules
make init

# 3️⃣ Install Dependencies (Frontend + Backend + Migrations)
make install
```

## 🔧 Development

```sh
# Start Frontend (Vite + Vue 3)
make start-frontend

# Start Backend (Django)
make start-backend

# Start Both (Frontend + Backend)
make start
```

## 🛠 Manual Setup (Without Makefile)

```sh
# Backend (Django)
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python manage.py runserver

# Frontend (Vite + Vue 3)
cd ../frontend
npm install
npm run dev
```

## 📜 License
This project is open-source and available under the **MIT License**.
