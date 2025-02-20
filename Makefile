init:
	git submodule update --init --recursive
	git submodule foreach --recursive 'git checkout main || git checkout -b main && git pull origin main'

init-env:
	cp -n backend/.env.example backend/.env || true
	cp -n frontend/.env.example frontend/.env || true
	cp -n database/.env.example database/.env || true

update:
	git submodule foreach --recursive 'git checkout main || git checkout -b main && git pull origin main'
	git add .
	@if ! git diff --cached --quiet; then \
		git commit -m "Update submodules to latest main branch"; \
		git push origin main; \
	else \
		echo "No changes to commit."; \
	fi



# Project Name
PROJECT_NAME=my_project

# Start services in development mode
dev:
	docker-compose --profile dev up -d

# Start services in production mode
prod:
	docker-compose --profile prod up -d

# Stop the running containers
down:
	docker-compose down

# Stop and remove containers, networks, and volumes
reset:
	docker-compose down -v

# Restart the containers (default: dev mode)
restart-dev: down dev
restart-prod: down prod

# Show running containers
ps:
	docker-compose ps

# View logs of all services
logs:
	docker-compose logs -f

# View logs for a specific service (e.g., make logs-service service=backend-dev)
logs-service:
	docker-compose logs -f $(service)

# Execute a command in a running container (e.g., make exec service=backend-dev cmd="ls -l")
exec:
	docker exec -it $(service) sh -c "$(cmd)"

# Build images without using the cache
build:
	docker-compose build --no-cache

# Build and restart containers
rebuild-dev: down build dev
rebuild-prod: down build prod

# Enter the MySQL shell using root
mysql:
	docker exec -it mysql mysql -u root -p

# Run Django management commands (e.g., make django-manage cmd="migrate")
django-manage:
	docker exec -it backend-django-dev python manage.py $(cmd)

# Run Django shell
django-shell:
	docker exec -it backend-django-dev python manage.py shell

# Clean up all Docker-related data (⚠️ WARNING: This removes ALL volumes & images)
clean:
	docker-compose down -v --remove-orphans
	docker system prune -af
	docker volume prune -f
