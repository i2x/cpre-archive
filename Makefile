.PHONY: init update push install-frontend install-backend install start-frontend start-backend start

# Detect OS
OS := $(shell uname 2>/dev/null || echo Windows)

# Git submodule initialization and update
init:
	git submodule update --init --recursive
	git submodule foreach --recursive 'git checkout main || git checkout -b main && git pull origin main'

update:
	git submodule foreach --recursive 'git checkout main || git checkout -b main && git pull origin main'
	git add .
	git commit -m "Update submodules to latest main branch"
	git push origin main

# Push all submodules and main repo
push:
	git submodule foreach --recursive 'git add . && git commit -m "Update submodule" || true && git push origin main'
	git push origin main

# Install dependencies for frontend (Vue.js)
install-frontend:
ifeq ($(OS), Windows)
	cd frontend && if not exist .env copy .env.example .env
else
	cd frontend && cp -n .env.example .env 2>/dev/null || true
endif
	cd frontend && npm install

# Install dependencies for backend (Django) and run migrations
install-backend:
ifeq ($(OS), Windows)
	cd backend && python -m venv venv
	cd backend && call venv\Scripts\activate && venv\Scripts\python -m pip install -r requirements.txt
	cd backend && venv\Scripts\python manage.py makemigrations
	cd backend && venv\Scripts\python manage.py migrate
	cd backend && venv\Scripts\python manage.py loaddata data.json
else
	cd backend && python3 -m venv venv && source venv/bin/activate && \
	pip install -r requirements.txt && python manage.py makemigrations && python manage.py migrate
	python manage.py loaddata data.json
endif

# Install both frontend and backend
install: install-frontend install-backend

# Start frontend server
start-frontend:
	cd frontend && npm run dev

# Start backend server (assumes migrations are already done)
start-backend:
ifeq ($(OS), Windows)
	cd backend && call venv\Scripts\activate && venv\Scripts\python manage.py runserver
else
	cd backend && source venv/bin/activate && python manage.py runserver
endif

# Start both frontend and backend in parallel
start:
ifeq ($(OS), Windows)
	cmd /C "start cmd /C make start-frontend"
	cmd /C "start cmd /C make start-backend"
else
	make start-frontend & make start-backend & wait
endif
