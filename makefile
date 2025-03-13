release: update_pyproject

update_pyproject:
	python3 mky_utils/update_dependencies.py

init: 
	pip install -r requirements.txt
	pre-commit install
