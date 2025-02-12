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
# Start Both (Frontend + Backend)
make start

# Start Frontend (Vite + Vue 3)
make start-frontend

# Start Backend (Django)
make start-backend

```

## 🧪 Running Tests

Run Django unit tests inside the virtual environment:

```sh
make test
```

## 🛠 Manual Setup (Without Makefile)

If you prefer to set up everything manually, follow these steps:

### Backend (Django)
```sh
cd backend
python3 -m venv venv
source venv/bin/activate  # On Windows use: venv\Scripts\activate
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python manage.py loaddata data.json
python manage.py runserver
```

### Frontend (Vue 3 + Vite)
```sh
cd frontend
cp .env.example .env  # On Windows: copy .env.example .env
npm install
npm run dev
```

### Running Django Tests Manually
```sh
cd backend
source venv/bin/activate  # On Windows use: venv\Scripts\activate
python manage.py test
```

## 📜 License
This project is open-source and available under the **MIT License**.
