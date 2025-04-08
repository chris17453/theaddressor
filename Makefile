# Makefile for TheAddressor

PACKAGE_NAME=theaddressor

.PHONY: help build check upload clean test testpypi

help:
	@echo "Makefile commands:"
	@echo "  build      - Build the package"
	@echo "  check      - Check build artifacts"
	@echo "  upload     - Upload to PyPI"
	@echo "  testpypi   - Upload to TestPyPI"
	@echo "  clean      - Remove build artifacts"
	@echo "  test       - Run all unit tests"

build:
	python3 -m pip install --upgrade build
	python3 -m build

check:
	python3 -m pip install --upgrade twine
	python3 -m twine check dist/*

upload:
	python3 -m twine upload dist/*

testpypi:
	python3 -m twine upload --repository testpypi dist/*

clean:
	rm -rf build/ dist/ *.egg-info

test:
	python3 -m unittest discover -s tests -p "*.py"
