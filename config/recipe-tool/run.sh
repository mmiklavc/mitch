#!/usr/bin/env bash

COMMAND=$1
SUB_COMMAND=$2

if [ "$COMMAND" == "submit" ]
then
    RECIPE_NAME=$3
    if [ "$SUB_COMMAND" == "hdfsmirror" ]
    then
        falcon recipe -name $RECIPE_NAME -operation HDFS_REPLICATION
    elif [ "$SUB_COMMAND" == "hivemirror" ]
    then
        falcon recipe -name $RECIPE_NAME -operation HIVE_DISASTER_RECOVERY
    fi
else
    java -cp lib/recipe-tool-1.0-SNAPSHOT-shaded.jar \
             com.hortonworks.recipetool.RecipeTool "$@"
fi
