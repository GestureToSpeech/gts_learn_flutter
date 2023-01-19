setup: ## Run on first download
	@echo "---------(1/3) Checking for flutter updates..---------"
	@flutter upgrade
	@echo "---------(2/3) Installing mason..---------"
	@dart pub global activate mason_cli
	@echo "---------(3/3) Initialising mason..---------"
	@mason init
	@mason get

builder: ## Run to get dependencies and rebuild
	@echo "---------(1/2) Getting dependencies..---------"
	@flutter pub get
	@echo "---------(2/2) Generating code..---------"
	@flutter pub run build_runner build --delete-conflicting-outputs

feature: ## Create a new feature and rebuild after that
	@echo "---------(1/2) Creating feature..---------"
	@mason make gts_feature
	@echo "---------(2/2) Generating code..---------"
	@flutter pub run build_runner build --delete-conflicting-outputs

format: ## Run before making PR
	@echo "---------(1/2) Formatting code..---------"
	@flutter format .
	@echo "---------(2/2) Analyzing code..---------"
	@dart analyze

b: ## Run after editing code marked with decorators @freezed, @injectable
	@echo "---------(1/1) Building..---------"
	@flutter pub run build_runner build --delete-conflicting-outputs

all: setup builder format