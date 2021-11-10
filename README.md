# Overview

This project is created in the context of the Udacity project and allows to have a practical execution of how an Integration flow and continuous deployment is carried out through GitHub and Azure Pipeline with a Python application and deployed to an Azure Web App.

## Project Plan
* A link to a Trello board for the project
https://trello.com/b/z3mKni0b/udacitycicd

* A link to a spreadsheet that includes the original and final project plan


## Architectural
* Architectural Diagram (Shows how key parts of the system work)

## Instructions
* Instructions Azure Cloud Shell:

    1) Login to Azure and open azure cloud shell

    2) Make the SSH connection from your Azure to Github

    ssh-keygen -t rsa
    cat /c/Users/faperezar/.ssh/id_rsa.pub  

    3) Gitclone the repository

    4) Create a virtual enviroment python and then do all our operations inside it and then activate it, you will see a previous parenthesis that indicates that we are already inside the environment

    python3 -m venv ~/udacity_proyecto2/.virtual_env
    source ~/udacity_proyecto2/.virtual_env/bin/activate

    5) Let's download all the dependencies to our virtual environment using our built makefile.Remember to position yourself in the root directory of our code

    6) Since our makefile also has pylint and pytest, both revisions will be executed as well.

    7) To finally execute our app we do it through flask that by default will look for our app.py and will raise it in a transitory environment.

    python -m flask run

* Instructions CICD Azure pipeline:

    1) As we have created our Azure Pipeline in the project to trigger the CD, it is enough to make a modification in the code and push it to github.

    

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


