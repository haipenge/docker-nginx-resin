###################Hadoop auto Install######################
#Write By haipenge@gmail.com
#2016.01.24
############################################################
#bin=`which "$0"`
#bin=`dirname "${bin}"`
#bin=`cd "$bin"; pwd`
#ROOT=$(dirname $(cd "$(dirname "$0")";pwd))
ROOT=$(cd $(dirname '$0');pwd)
cd $ROOT

HADOOP_VERSION=2.6.3
wget http://apache.fayea.com/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz .