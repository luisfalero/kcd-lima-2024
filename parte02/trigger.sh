#!/bin/bash

if [ $# -eq 2 ]
then
    NAMESPACE=$1
    USER_GIT=$2

    sed -i "s/<namespace>/${NAMESPACE}/g" ./03-route-github-event-listener.yaml
    sed -i "s/<username>/${USER_GIT}/g" ./06-trigger-template.yaml
    oc -n ${NAMESPACE} apply -f .
else
    echo "Cantidad de parametros incorrecta"
    echo "Ejecutar de la siguiente forma:"
    echo $0" <Namespace> <User Git>"
fi

#./trigger.sh "kcd40" "luisfalero"