[![Badged Github Action](https://github.com/faperezar/udacity_proyecto2/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)](https://github.com/faperezar/udacity_proyecto2/Python%20application%20test%20with%20Github%20Actions)

# Overview

This project is created in the context of the Udacity project and allows to have a practical execution of how an Integration flow and continuous deployment is carried out through GitHub and Azure Pipeline with a Python application and deployed to an Azure Web App.

## Project Plan
* A link to a Trello board for the project
https://trello.com/b/z3mKni0b/udacitycicd

* A link to a spreadsheet that includes the original and final project plan
https://github.com/faperezar/udacity_proyecto2/blob/d5d6f9602583e73dad3160ecc2b33d60ef2e6d73/files/Project%20Plan%20v2.xlsx

## Architectural
* Architectural Diagram (Shows how key parts of the system work)
![Architectural](https://github.com/faperezar/udacity_proyecto2/blob/ab8e3e748ed749d448e78edf638b864d5556bf21/files/Diagram.png)

## Instructions
* Instructions Azure Cloud Shell:

1) Login to Azure and open azure cloud shell
    
    ![Azure_Cloud_Shell](https://github.com/faperezar/udacity_proyecto2/blob/84ada533f86ca249d250cf61cddd322cf6efc017/files/Ins%201.png)

2) Make the SSH connection from your Azure to Github
    
    ```
    ssh-keygen -t rsa
    cat /c/Users/faperezar/.ssh/id_rsa.pub
    ```
    
    ![SSH](https://github.com/faperezar/udacity_proyecto2/blob/84ada533f86ca249d250cf61cddd322cf6efc017/files/Ins%202.png)

3) Gitclone the repository

    ![Repository_clone](https://github.com/faperezar/udacity_proyecto2/blob/84ada533f86ca249d250cf61cddd322cf6efc017/files/Ins%203.png)

4) Create a virtual enviroment python and then do all our operations inside it and then activate it, you will see a previous parenthesis that indicates that we are already inside the environment

    ```
    python3 -m venv ~/udacity_proyecto2/.virtual_env
    source ~/udacity_proyecto2/.virtual_env/bin/activate
    ```

    ![Env_cirtual](https://github.com/faperezar/udacity_proyecto2/blob/84ada533f86ca249d250cf61cddd322cf6efc017/files/Ins%204.png)

    Note that when doing it from local, the "active" file changes its place, so when activating it we should use something like this:

    Example creation CMD: python3 -m venv ~/.virtual_env

    Example active BASH: source "C:\Users\faperezar\Desktop\Cursos\Udacity - Devops using Microsoft Azure\2 - CICD\udacity_proyecto2\~\udacity_proyecto2\.virtual_env\Scripts\activate"

5) Let's download all the dependencies to our virtual environment using our built makefile.Remember to position yourself in the root directory of our code

    ![Dependecy](https://github.com/faperezar/udacity_proyecto2/blob/84ada533f86ca249d250cf61cddd322cf6efc017/files/Ins%205.png)

6) Since our makefile also has pylint and pytest, both revisions will be executed as well.

    ![Make_all](https://github.com/faperezar/udacity_proyecto2/blob/84ada533f86ca249d250cf61cddd322cf6efc017/files/Ins%206.png)

7) To finally execute our app we do it through flask that by default will look for our app.py and will raise it in a transitory environment.
    
    ```
    python -m flask run
    ```
        
    ![Flask_run](https://github.com/faperezar/udacity_proyecto2/blob/84ada533f86ca249d250cf61cddd322cf6efc017/files/Ins%207.png)


    ```
    bash make_prediction.sh
    ```

    ![Predict](https://github.com/faperezar/udacity_proyecto2/blob/6100db5b7e06bf644f8d7f23990b9d818ca46b04/files/Predict.png)


* Instructions CICD Azure pipeline and webapp deployment:

1) As we have created our Azure Pipeline in the project to trigger the CD, it is enough to make a modification in the code and push it to github.
    
    ```
    git add [files] 
    git commit -m "commit_description" 
    git push
    ```

2) The pipeline has two major stages, a CI which builds the virtual environment, installs the dependencies, builds and publishes the package of our app, and a second stage of deployment to our webapp. Important that this is done through our previously created service connection that connects Azure Devops with the Azure Web App.

    ![Azure_pipeline](https://github.com/faperezar/udacity_proyecto2/blob/84ada533f86ca249d250cf61cddd322cf6efc017/files/Ins%208.png)

3) We can see our app through the URL that the pipeline enters us. Important that in case our app.py is not in the root directory or has another name, we must modify the starting file of the webapp.

    ![URL_web_app](https://github.com/faperezar/udacity_proyecto2/blob/84ada533f86ca249d250cf61cddd322cf6efc017/files/Ins%209.png)

4) We can see the log of our webapp to see who has used it and when.

    ```
    az webapp log tail --resource-group RG-DESA-UDACITY --name wa-desa-udacity
    ```

    ![WA_log_tail](https://github.com/faperezar/udacity_proyecto2/blob/84ada533f86ca249d250cf61cddd322cf6efc017/files/Ins%2010.png)

5) To directly test the model of the raised application, we can occupy the following file, which finally makes a POST to the raised service in the web app. However, we can also test it with any assistant such as POSTMAN.

```bash
./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

6) We can also run a simple performance test with the locust python library. In this case we run 10 concurrent users on the application and on the predict method.

```
bash locust -f locustfile.py QuickstartUser --host https://wa-desa-udacity.azurewebsites.net:
```

We run on = http://localhost:8089/

    ![Locust](https://github.com/faperezar/udacity_proyecto2/blob/d9629d05aff2661d959427adf86f725f1ff88b88/files/Locust.png)

* Annexed

1) We can include badges of how the last execution of the Pipeline or Github Action associated with our repository resulted in the Readme.

     ![Badged](https://github.com/faperezar/udacity_proyecto2/blob/5ee01fe863be9d34ceb62f97d45321430443f08f/files/Badged.png)


2) Remember that we also configure a GitHub Action that is triggered with any modification in our branch.

    ![GitHub Action](https://github.com/faperezar/udacity_proyecto2/blob/503ff45de2c5e0ef885fe1eeb4890c421ba519db/files/GitHubAction.png)

3) We can see the correct execution of the deployment from our web app as well to the deployment center.

    ![WA Deployment](https://github.com/faperezar/udacity_proyecto2/blob/cb108d5c364cb60fbe57eb437ae613168638ac47/files/AZ%20WA%20Deployment%20Center.png)

4) We can make a .sh file to make it easier for the user to execute bash commands. It is a similar to make.

    ![CommandSH](https://github.com/faperezar/udacity_proyecto2/blob/2adb90d405e7e54584df846ceb4233bf27e4824e/files/CommandSH.png)


## Enhancements

* Strengthen the unit test stage
* Incorporate automated integration and / or performance tests to the CI
* Deploy the infrastructure with terraform

## Demo 

Video Demo Youtube: <br>
[![Demo](https://img.youtube.com/vi/pdLPVPG0JRA/0.jpg)](https://www.youtube.com/watch?v=pdLPVPG0JRA)



