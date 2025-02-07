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

### 1️⃣ Clone the Repository
```sh
git clone --recursive https://github.com/yourusername/cpre-archive.git
cd cpre-archive
```

### 2️⃣ Initialize and Update Submodules
```sh
make init
```

### 3️⃣ Install Dependencies
```sh
make install
```

## 🔧 Development

### Start Frontend (Vite + Vue 3)
```sh
make start-frontend
```

### Start Backend (Django)
```sh
make start-backend
```

### Start Both (Frontend + Backend)
```sh
make start
```

## 🛠 Manual Setup (Without Makefile)

### Backend (Django)
```sh
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python manage.py runserver
```

### Frontend (Vite + Vue 3)
```sh
cd frontend
npm install
npm run dev
```

## 📜 License
This project is open-source and available under the **MIT License**.
