hello:
	echo "Inicio ejecucion Make File"

setup:
	#python3 -m venv ~/udacity_proyecto2/.virtual_env
		#source ~/.virtual_env/bin/activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	python -m pylint --disable=R,C,W1203,W0702 app.py

test:
	echo "Sin pruebas unitarias configuradas"
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

final:
	echo "Final ejecucion Make File"

all: hello setup install lint test final