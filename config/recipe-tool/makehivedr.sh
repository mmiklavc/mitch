#!/bin/bash

pushd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" > /dev/null

echo "Running..."

export DATABASE=hivemirror

rm tables.ddl
rm load.ddl
rm bootstrap-out.ddl
rm bootstrap-in.ddl

for i in {a..z}
do
    cat << ENDSH >> tables.ddl
DROP TABLE IF EXISTS ${DATABASE}.feed${i};
CREATE TABLE ${DATABASE}.feed${i}(
    col1 string,
    col2 string,
    col3 string,
    col4 string,
    col5 string,
    col6 string,
    col7 string,
    col8 string,
    col9 string,
    col10 string
)
PARTITIONED BY (ds STRING)
ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

ENDSH

    cat << ENDSH >> load.ddl
LOAD DATA LOCAL INPATH 'data.csv' OVERWRITE INTO TABLE ${DATABASE}.feed${i} PARTITION (ds='2016-05-01');
ENDSH

    cat << ENDSH >> bootstrap-out.ddl
EXPORT TABLE ${DATABASE}.feed${i} TO '/user/ambari-qa/hivemirror/feed${i}' FOR replication('bootstrapping');
ENDSH

    cat << ENDSH >> bootstrap-in.ddl
USE HIVEMIRROR; IMPORT TABLE feed${i} FROM '/user/ambari-qa/hivemirror/feed${i}';
ENDSH

done

echo "Done running"

popd > /dev/null

