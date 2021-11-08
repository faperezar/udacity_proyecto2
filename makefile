hello:
	echo "Inicio ejecucion Make File"

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	python -m pylint --disable=R,C hello.py

test:
	python -m pytest -vv test_hello.py

final:
	echo "Final ejecucion Make File"

all: hello install lint test final