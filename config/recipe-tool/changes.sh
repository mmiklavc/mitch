#!/bin/bash

pushd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" > /dev/null

echo "Running..."

# CHANGES
# Add file to existing partition
# Add partition
# Create new Hive table in DB and load
# Overwrite existing partition
# Delete table from Hive

hdfs dfs -put data.csv /apps/hive/warehouse/hivemirror.db/feedb/ds=2016-05-01/data2.csv
hive -f newtable.ddl
hive -e "LOAD DATA LOCAL INPATH 'data.csv' OVERWRITE INTO TABLE hivemirror.feedc PARTITION (ds='2016-05-02');\
         LOAD DATA LOCAL INPATH 'overwritedata.csv' OVERWRITE INTO TABLE hivemirror.feedd PARTITION (ds='2016-05-01');\
         LOAD DATA LOCAL INPATH 'data.csv' OVERWRITE INTO TABLE hivemirror.feedaNEWTABLE PARTITION (ds='2016-05-01');\
         drop table hivemirror.feedZ;"

echo "Done running"

popd > /dev/null

