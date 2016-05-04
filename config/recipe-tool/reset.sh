#!/bin/bash

pushd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" > /dev/null

echo "Running..."

echo "setup db"
hive -e "drop database hivemirror cascade;\
         create database hivemirror"
echo "setup tables"
hive -f tables.ddl
echo "load data"
hive -f load.ddl
echo "bootstrap hive export"
hive -f bootstrap-out.ddl
echo "export data"
./export.sh
echo "make changes locally not in bootstrap"
./changes.sh

echo "Done running"

popd > /dev/null

