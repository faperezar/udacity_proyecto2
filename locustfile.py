import time
from locust import HttpUser, task, between

"""Esta prueba:
La iniciamos con (bash): 
locust -f locustfile.py QuickstartUser --host https://wa-desa-udacity.azurewebsites.net:443

La iniciamos en: http://localhost:8089/

La configuramos con:
Número de usuarios: 10
Tasa de eclosión: 1
Ejemplo: Cada segundo se agregan 1 usuarios a los usuarios actuales a partir de 0, 
por lo que en 10 segundos tendrá 10 usuarios. Cuando llegue al número de usuarios, 
se detendra el incremento.
"""
#Las clases de usuario es la prueba como tal que indica que se hara, puedo tener mas de una y la especifico en el comando de ejecución

class QuickstartUser(HttpUser):
#Tiempo de espera entre tareas que realiza cada usuario
    wait_time = between(1, 5)

#Se definen las tareas que la prueba hara que cada usuario haga, en general se toman al azar
#pero podemos darle un ponderador, en este caso la segunda tarea tiene 3 veces mas de prob de hacerse.

#En este caso tenemos dos tareas, una de un get al main y otra de un post al path predict
    @task
    def main(self):
        self.client.get("/")

    @task
    def predict(self):
        self.client.post("/predict", json={"CHAS":{"0":0}, "RM":{"0":6.575}, "TAX":{"0":296.0}, "PTRATIO":{"0":15.3}, "B":{"0":396.9}, "LSTAT":{"0":4.98}})

#Ejemplo caso de request con parametro variable (usa el item id de 1 a 10 de forma variable)
"""
    @task(3)
    def view_items(self):
        for item_id in range(10):
            self.client.get(f"/item?id={item_id}", name="/item")
            time.sleep(1)
"""
