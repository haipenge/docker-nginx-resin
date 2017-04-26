####################Download Script###########################
#Docker File
#Include:
#1).ant
#2).maven
#Author:haipenge@gmail.com
##############################################################
ROOT=$(cd $(dirname '$0');pwd)
current_date=`date +%Y%m%d-%H%M%S`
##版本
ANT_VERSION=1.10.1
M2_VERSION=3.5.0
JDK_VERSION=1.7.0_80
JDK_PACKAGE=8u131-b11
JDK_FILE_NAME=jdk-8u131-linux-x64.tar.gz
RESIN_VERSION=4.0.47
HADOOP_VERSION=2.8.0
STORM_VERSION=1.1.0
KAFKA_VERSION=0.10.2.0
SPARK_VERSION=2.1.0
FLUME_VERSION=1.7.0
#
ROOT="/app"
cd $ROOT
mkdir -p ant maven resin jdk bak hadoop
#Download ant
cd $ROOT/ant
wget https://mirrors.tuna.tsinghua.edu.cn/apache/ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz .
tar -zxvf apache-ant-$ANT_VERSION-bin.tar.gz
#下载Maven
cd $ROOT/maven
wget http://mirror.bit.edu.cn/apache/maven/maven-3/$M2_VERSION/binaries/apache-maven-$M2_VERSION-bin.tar.gz .
tar -zxvf apache-maven-$M2_VERSION-bin.tar.gz

#Download hadoop
cd $ROOT/hadoop
wget http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz .
tar -zxvf hadoop-$HADOOP_VERSION.tar.gz
#Download storm
cd $ROOT/storm
wget http://mirrors.tuna.tsinghua.edu.cn/apache/storm/apache-storm-$STORM_VERSION/apache-storm-$STORM_version.tar.gz .
tar -zxvf apache-storm-$STORM_version.tar.gz

#Download kafka
cd $ROOT/kafka
wget http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/$KAFKA_VERSION/kafka_2.10-$KAFKA_VERSION.tgz .
tar -zxvf kafka_2.10-$KAFKA_VERSION.tgz

#Download spark
cd $ROOT/spark
wget http://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.7.tgz .
tar -zxvf spark-$SPARK_VERSION-bin-hadoop2.7.tgz

#Download flume
cd $ROOT/flume
wget http://mirrors.tuna.tsinghua.edu.cn/apache/flume/$FLUME_VERSION/apache-flume-$FLUME_VERSION-bin.tar.gz .
tar -zxvf apache-flume-$FLUME_VERSION-bin.tar.gz

#Download jdk
cd $ROOT/jdk
curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/$JDK_PACKAGE/$JDK_FILE_NAME -O
tar -zxvf $JDK_FILE_NAME

#Set JAVA base env in  '�etc/profile'
JAVA_HOME=$ROOT/jdk/jdk$JDK_VERSION
PATH=$JAVA_HOME/bin:$PATH
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ANT_HOME=$ROOT/ant/apache-ant-$ANT_VERSION
M2_HOME=$ROOT/maven/apache-maven-$MAVEN_VERSION
PATH=$M2_HOME/bin:$PATH
PATH=$ANT_HOME/bin:$PATH
export M2_HOME
export ANT_HOME
export PATH
export CLASSPATH
#/etc/profile config info.
#JAVA_HOME=/usr/local/java/jdk1.7.0_80
#PATH=$JAVA_HOME/bin:$PATH
#CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
#ANT_HOME=/data/tools/ant/apache-ant-1.9.6
#M2_HOME=/data/tools/maven/apache-maven-3.3.3
#PATH=$M2_HOME/bin:$PATH
#PATH=$ANT_HOME/bin:$PATH
#export M2_HOME
#export ANT_HOME
#export JAVA_HOME
#export PATH
#export CLASSPATH

#Down load resin
#cd $ROOT/resin
#wget http://caucho.com/download/resin-$RESIN_VERSION.tar.gz .
#tar -zxvf resin-$RESIN_VERSION.tar.gz
#mv $ROOT/resin/resin-$RESIN_VERSION/conf/resin.xml $ROOT/bak/resin.xml_$current_date
#cp $ROOT/resin.xml $ROOT/resin/resin-$RESIN_VERSION/conf/
#mv $ROOT/resin/resin-$RESIN_VERSION/conf/resin.properties $ROOT/bak/resin.properties_$current_date
#cp $ROOT/resin.properties $ROOT/resin/resin-$RESIN_VERSION/conf/

#启动Resin



