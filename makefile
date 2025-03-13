VERSION_INCREMENT := 0.0.1
LATEST_TAG := $(shell git describe --tags --abbrev=0)
NEW_VERSION := $(shell python -c "from packaging.version import parse; v = parse('$(LATEST_TAG)'); base = v.base_version.split('.'); new_patch = int(base[2]) + 1; print('v' + '.'.join(base[:2] + [str(new_patch)]))")

release:
	@echo "Latest tag: $(LATEST_TAG)"
	@echo "New version: $(NEW_VERSION)"
	@echo "Committing changes and tagging new version"

	git tag $(NEW_VERSION)
	git commit -m "Prepare for release $(NEW_VERSION)"
	git push origin main
	git push origin $(NEW_VERSION)

update_pyproject:
	python3 mky_utils/update_dependencies.py

init: 
	pip install -r requirements.txt
	pre-commit install
