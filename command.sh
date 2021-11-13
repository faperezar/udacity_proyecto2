#!/usr/bin/env bash

echo "Start command for project execution"

git clone git@github.com:faperezar/udacity_proyecto2.git

python3 -m venv ~/udacity_proyecto2/.virtual_env
source ~/udacity_proyecto2/.virtual_env/bin/activate

cd udacity_proyecto2

make all

az account set --subscription 0b4ab24a-0d05-4919-ba1b-1eb51dc27fc8
az group create --name RG-DESA-UDACITY --location eastus
az webapp up --sku F1 -n wa-desa-udacity

bash make_predict_azure_app.sh

az webapp log tail --resource-group RG-DESA-UDACITY --name wa-desa-udacity

echo "Finish command for project execution"