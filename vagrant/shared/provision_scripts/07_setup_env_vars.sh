 cat << EOF >> ~/.bashrc
export SPARK_HOME=/home/vagrant/.local/lib/python3.8/site-packages/pyspark
export PATH=\$SPARK_HOME/bin:\$PATH
export PYSPARK_PYTHON=python3
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
EOF
