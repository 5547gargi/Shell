#!/bin/bash

 read -p "enter desiredFrmat: " input

if [[ ${input} == "csv" ]]
then
    jq -r '["nsName","creationDate"],(.items[]|[.metadata.name,.metadata.creationTimestamp])|@csv' <<< "$(kubectl get ns -o json)"
elif [[ ${input} == "tsv" ]]
then
    jq -r '["nsName","creationDate"],(.items[]|[.metadata.name,.metadata.creationTimestamp])|@tsv' <<< "$(kubectl get ns -o json)"
else
    echo "Provide proper fileformat !!!"
    echo "<Usage>"
    echo "<csv> OR <tsv>"
fi


# jq '{"namespacesDetails":[.items[]|{"name":.metadata.name,"creationdate":.metadata.creationTimestamp}]}' <<< "$(kubectl get ns -o json)"