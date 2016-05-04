hive -e "LOAD DATA LOCAL INPATH 'data.csv' OVERWRITE INTO TABLE hivedr.indata PARTITION (ds='2016-05-02');"
