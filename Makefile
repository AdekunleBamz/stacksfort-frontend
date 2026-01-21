# StacksFort Frontend Development Makefile

.PHONY: help install dev build lint clean docker-build docker-run docker-stop setup env-setup info

help: ## Show this help message
	@echo "StacksFort Frontend Commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	npm install

dev: ## Start dev server
	npm run dev

build: ## Build app
	npm run build

lint: ## Lint app
	npm run lint

clean: ## Clean build artifacts
	rm -rf .next node_modules/.cache

docker-build: ## Build Docker image
	docker build -t stacksfort-frontend .

docker-run: ## Run Docker container
	docker run -it --rm -p 3000:3000 stacksfort-frontend

docker-stop: ## No-op for local dev
	@echo "Nothing to stop."

setup: install ## Setup development environment
	@echo "Setup complete."

env-setup: ## Create .env template
	@echo "Creating .env file..."
	@echo "# StacksFort frontend env" > .env
	@echo "NEXT_PUBLIC_APP_NAME=StacksFort" >> .env
	@echo "NEXT_PUBLIC_BASE_URL=http://localhost:3000" >> .env

info: ## Show project information
	@echo "StacksFort Frontend"
	@echo "Framework: Next.js 16"