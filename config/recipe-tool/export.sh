#!/bin/bash

#hdfs dfs -rm -r /user/ambari-qa/hivedr
#hive -e "EXPORT TABLE hivedr.indata TO '/user/ambari-qa/hivedr/indata' FOR replication('bootstrapping');"
hadoop distcp hdfs://primary:8020/user/ambari-qa/hivemirror/ hdfs://backup:8020/user/ambari-qa/hivemirror/

