hive -e "LOAD DATA LOCAL INPATH 'data.csv' OVERWRITE INTO TABLE hivedr.indata PARTITION (ds='2016-05-03');"
hive -e "LOAD DATA LOCAL INPATH 'data.csv' OVERWRITE INTO TABLE hivedr.indata PARTITION (ds='2016-05-04');"
