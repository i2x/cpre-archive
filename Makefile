init:
	git submodule update --init --recursive
	git submodule foreach --recursive 'git checkout main || git checkout -b main && git pull origin main'

update:
	git submodule foreach --recursive 'git checkout main || git checkout -b main && git pull origin main'
	git add .
	git commit -m "Update submodules to latest main branch"
	git push origin main
