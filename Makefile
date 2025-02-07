.PHONY: init update install-frontend install-backend install start-frontend start-backend start

# Initialize and update submodules
init:
	git submodule update --init --recursive

update:
	git submodule update --remote --merge

# Install dependencies for frontend (Vue.js)
install-frontend:
	cd frontend && npm install

# Install dependencies for backend (Django)
install-backend:
	cd backend && python3 -m venv venv && source venv/bin/activate && pip install -r requirements.txt

# Install both frontend and backend
install: install-frontend install-backend

# Start frontend server
start-frontend:
	cd frontend && npm run dev

# Start backend server
start-backend:
	cd backend && source venv/bin/activate && python manage.py runserver

# Start both frontend and backend
start: start-frontend start-backend
