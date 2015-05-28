#!/bin/bash

mkdir /opt/proofpoint/spark-cassandra-connector
cd /opt/proofpoint/spark-cassandra-connector

rm *.jar

wget --no-check-certificate -O ivy-2.3.0.jar 'http://search.maven.org/remotecontent?filepath=org/apache/ivy/ivy/2.3.0/ivy-2.3.0.jar'
wget --no-check-certificate -O spark-cassandra-connector_2.11-1.2.1.jar \
  'http://search.maven.org/remotecontent?filepath=com/datastax/spark/spark-cassandra-connector_2.11/1.2.1/spark-cassandra-connector_2.11-1.2.1.jar'

ivy () { java -jar ivy-2.3.0.jar -dependency $@ -retrieve "[artifact]-[revision](-[classifier]).[ext]"; }

ivy com.datastax.spark spark-cassandra-connector_2.11 1.2.1 

#rm -f *-{sources,javadoc}.jar

