.PHONY: init update push install-frontend install-backend install start-frontend start-backend start

# Initialize and update submodules, ensuring they are on branch main
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
	cd frontend && cp -n .env.example .env 2>/dev/null || true && npm install

# Install dependencies for backend (Django) and run migrations
install-backend:
	cd backend && cp -n .env.example .env 2>/dev/null || true && \
	python3 -m venv venv && source venv/bin/activate && \
	pip install -r requirements.txt && python manage.py makemigrations && python manage.py migrate

# Install both frontend and backend
install: install-frontend install-backend

# Start frontend server
start-frontend:
	cd frontend && npm run dev

# Start backend server (assumes migrations are already done)
start-backend:
	cd backend && source venv/bin/activate && python manage.py runserver

# Start both frontend and backend in parallel
start:
	make start-frontend & make start-backend & wait
