#/bin/bash

sudo apt update
sudo apt install -y default-jre default-jdk
sudo apt install -y python3
sudo apt install -y python3-pip
pip3 install pyspark

lines_to_append="export SPARK_HOME=/home/vagrant/.local/lib/python3.8/site-packages/pyspark
export PATH=\$SPARK_HOME/bin:\$PATH
export PYSPARK_PYTHON=python3"

# Append the lines to .bashrc
echo "$lines_to_append" >> ~/.bashrc
