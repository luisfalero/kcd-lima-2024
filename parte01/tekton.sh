#!/bin/bash

if [ $# -eq 4 ]
then
    NAMESPACE=$1
    USER_GIT=$2
    PASSWORD_GIT=$3
    EMAIL_GIT=$4

    sed -i "s/<namespace>/${NAMESPACE}/g" ./04-task-build-image.yaml
    sed -i "s/<username>/${USER_GIT}/g" ./05-secret-github.yaml
    sed -i "s/<password>/${PASSWORD_GIT}/g" ./05-secret-github.yaml
    sed -i "s/<email>/${EMAIL_GIT}/g" ./05-secret-github.yaml
    sed -i "s/<username>/${USER_GIT}/g" ./09-pipeline-quarkus-native.yaml
    oc -n ${NAMESPACE} apply -f .
else
    echo "Cantidad de parametros incorrecta"
    echo "Ejecutar de la siguiente forma:"
    echo $0" <Namespace> <User Git> <Password Git> <Email Git>"
fi

#./tekton.sh "kcd36" "luisfalero" "ghp_VMDv8GdDP...." "lufao1427@gmail.com"