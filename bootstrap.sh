########################启动脚本###########################
#说明:本脚本在docker容器第一次启动后初始化环境时使用
#作者:haipenge@gmail.com
##########################################################
##启动脚本
ROOT=$(cd $(dirname '$0');pwd)
cd $ROOT
./nginx-install.sh
cd $ROOT
./download.sh
exit 0