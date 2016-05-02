#!/bin/bash

pushd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" > /dev/null

echo "Running..."

# Add file to existing partition
hdfs dfs -put data.csv /apps/hive/warehouse/hivemirror.db/feedb/ds=2016-05-01/data2.csv

# Add partition
# Create new Hive table in DB and load
# Overwrite existing partition
# Delete table from Hive
hive -e "LOAD DATA LOCAL INPATH 'data.csv' OVERWRITE INTO TABLE hivemirror.feedc PARTITION (ds='2016-05-02');\
         LOAD DATA LOCAL INPATH 'overwritedata.csv' OVERWRITE INTO TABLE hivemirror.feedd PARTITION (ds='2016-05-01');\
         LOAD DATA LOCAL INPATH 'data.csv' OVERWRITE INTO TABLE hivemirror.feedaNEWTABLE PARTITION (ds='2016-05-01');\
         drop table hivemirror.feedZ;"

echo "Done running"

popd > /dev/null

