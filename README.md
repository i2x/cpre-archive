# CPRE Archive

A full-stack document storage system built with **Django** (backend) and **Vue 3 + Vite** (frontend). Supports both **native** and **Docker** setups.

## 📂 Project Structure
```
📦 cpre-archive
├── 📁 frontend   # Vue 3 + Vite frontend
├── 📁 backend    # Django backend
├── 📁 database   # MySQL database setup
└── 📄 Makefile   # Automation commands
```

## 🚀 Getting Started
### 🔧 Native Setup
```sh
# 1️⃣ Clone the Repository
git clone --recursive https://github.com/i2x/cpre-archive.git
cd cpre-archive

# 2️⃣ Initialize and Update Submodules
make init

# 3️⃣ Install Dependencies (Frontend + Backend + Migrations)
make install
```

### 🔥 Start Development (Native)
```sh
# Start Frontend (Vite + Vue 3)
make start-frontend

# Start Backend (Django)
make start-backend

# Start Both (Frontend + Backend)
make start
```

### 🛠 Manual Setup (Without Makefile)
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

---

## 🐳 Docker Setup
### 🔧 Development Mode
```sh
# 1️⃣ Start in Development Mode
make dev
```

### 🚀 Production Mode
```sh
# 1️⃣ Start in Production Mode
make prod
```

### 📌 Docker Commands
```sh
# Stop running containers
make down

# Stop and remove containers, networks, and volumes
make reset

# Restart the containers in development mode
make restart-dev

# Restart the containers in production mode
make restart-prod

# View running containers
make ps

# View logs of all services
make logs

# View logs for a specific service (e.g., backend-dev)
make logs-service service=backend-dev

# Execute a command inside a running container (e.g., ls -l)
make exec service=backend-dev cmd="ls -l"

# Build images without cache
make build

# Build and restart containers in development mode
make rebuild-dev

# Build and restart containers in production mode
make rebuild-prod
```

### 🛠 Database Setup (MySQL)
```sh
# Open MySQL shell
make mysql
```

### 🛠 Django Management via Docker
```sh
# Run Django commands (e.g., migrate)
make django-manage cmd="migrate"

# Open Django shell
make django-shell
```

### ⚠️ Cleanup
```sh
# Remove all Docker-related data (⚠️ WARNING: This removes ALL volumes & images)
make clean
```

## 📜 License
This project is open-source and available under the **MIT License**.
