#!/bin/bash

# Update package lists
sudo apt-get update

# Install Java
sudo apt-get install -y default-jdk

# Install Hadoop (adjust version if needed)
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
tar -xzvf hadoop-3.3.1.tar.gz
sudo mv hadoop-3.3.1 /opt/hadoop

# Configure Hadoop environment variables
echo 'export HADOOP_HOME=/opt/hadoop' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/bin' >> ~/.bashrc
source ~/.bashrc

# Create Hadoop data directories
sudo mkdir -p /app/hadoop/tmp
sudo chown -R vagrant:vagrant /app/hadoop/tmp

# Configure core-site.xml
echo '<configuration>
  <property>
    <name>fs.defaultFS</name>
    <value>hdfs://localhost:9000</value>
  </property>
  <property>
    <name>hadoop.tmp.dir</name>
    <value>/app/hadoop/tmp</value>
  </property>
</configuration>' | sudo tee $HADOOP_HOME/etc/hadoop/core-site.xml

# Configure hdfs-site.xml
echo '<configuration>
  <property>
    <name>dfs.replication</name>
    <value>1</value>
  </property>
</configuration>' | sudo tee $HADOOP_HOME/etc/hadoop/hdfs-site.xml

# Start HDFS
$HADOOP_HOME/sbin/start-dfs.sh

# Start YARN
$HADOOP_HOME/sbin/start-yarn.sh

echo "Hadoop HDFS and YARN installation complete."

