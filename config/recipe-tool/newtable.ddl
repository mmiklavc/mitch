CREATE TABLE if not exists hivemirror.feedaNEWTABLE (
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
