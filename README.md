# spark
# Installation
kb scp Spark 1 spark-1.3.1-bin-hadoop2.6.tgz /home/jsabin
sudo tar -C /opt/proofpoint/ -xzf spark-1.3.1-bin-hadoop2.6.tgz
sudo ln -s /opt/proofpoint/spark-1.3.1-bin-hadoop2.6/ /opt/proofpoint/spark
#kb scp Spark 1 /home/jsabin/temp/spark/log4j.properties /home/jsabin
#kb ssh Spark 1 sudo mv log4j.properties /opt/proofpoint/spark/conf
kb scp Spark 1 /home/jsabin/temp/spark/spark-env.sh /home/jsabin
sudo mv spark-env.sh /opt/proofpoint/spark/conf

# Start Master and slaves
sudo /opt/proofpoint/spark/sbin/stop-master.sh
sudo /opt/proofpoint/spark/sbin/start-slave.sh 1 spark://m0054687.lab.ppops.net:7077

# Init scripts
kb scp cassandra 5 spark_master /home/jsabin
kb scp cassandra 5 spark_worker /home/jsabin
sudo mv spark_master.sh /etc/init.d
sudo mv spark_worker.sh /etc/init.d
sudo chown root spark_*
sudo chgrp root spark_*
sudo chmod +x spark_*
sudo /sbin/chkconfig --add spark_master
sudo /sbin/chkconfig spark_master on
sudo /sbin/chkconfig --add spark_worker
sudo /sbin/chkconfig spark_worker on

# Cassandra connector
kb scp spark 5 download-connector.sh /home/jsabin
ssh chmod +x download-connector.sh
sudo ./download-connector.sh

# Run Spark Shell
/opt/proofpoint/spark/bin/spark-shell --driver-class-path $(echo /opt/proofpoint/spark-cassandra-connector/*.jar | sed 's/ /:/g')


Get connected to cassandra


threaddb 
assignments heartbeat vertex_user_prop vertex_user_prop_index
