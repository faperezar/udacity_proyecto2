hello:
	echo "Inicio ejecucion Make File"

setup:
	#python3 -m venv ~/udacity_proyecto2/.virtual_env
		#source "C:\Users\faperezar\Desktop\Cursos\Udacity - Devops using Microsoft Azure\2 - CICD\udacity_proyecto2\~\udacity_proyecto2\.virtual_env\Scripts\activate"
		#source ~/udacity_proyecto2/.virtual_env/bin/activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	python -m pylint --disable=R,C,W1203,W0702,W0511 app.py
		python -m pylint --disable=R,C,W1203,W0702 hello.py

test:
	python -m pytest -vv test_hello.py

final:
	echo "Final ejecucion Make File"

all: hello install lint test final