# CPRE Archive

A full-stack document storage system built with **Django** (backend) and **Vue 3 + Vite** (frontend). Supports both **native** and **Docker** setups.

## 📂 Project Structure
```
📦 cpre-archive
├── 📁 frontend   # Vue 3 + Vite frontend
├── 📁 backend    # Django backend
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
docker-compose --profile dev up -d
```

### 🚀 Production Mode
```sh
# 1️⃣ Start in Production Mode
docker-compose --profile prod up -d
```

### 📌 Docker Commands
```sh
# Stop running containers
docker-compose down

# Stop and remove containers, networks, and volumes
docker-compose down -v

# Restart the containers (default: dev mode)
make restart-dev
make restart-prod

# View running containers
docker-compose ps

# View logs
docker-compose logs -f

# View logs for a specific service (e.g., backend-dev)
make logs-service service=backend-dev

# Execute a command inside a running container (e.g., ls -l)
make exec service=backend-dev cmd="ls -l"

# Build images without cache
docker-compose build --no-cache

# Build and restart containers
make rebuild-dev
make rebuild-prod
```

### 🛠 Django Management via Docker
```sh
# Run Django commands (e.g., migrate)
make django-manage cmd="migrate"

# Open Django shell
make django-shell
```

### 🗄 Database Access
```sh
# Open MySQL shell
docker exec -it mysql mysql -u root -p
```

### ⚠️ Cleanup
```sh
# Remove all Docker-related data (⚠️ WARNING: This removes ALL volumes & images)
docker-compose down -v --remove-orphans
docker system prune -af
docker volume prune -f
```

## 📜 License
This project is open-source and available under the **MIT License**.
