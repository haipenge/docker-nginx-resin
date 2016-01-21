
# docker-nginx-resin
centos 6 with nginx and resin

1.解决问题
  容器配置简单重复，测试环境不统一
2.相关技术
  docker,centos,nginx,resin
3.如何使用
  1).前置条件
     成功安装docker
     如何安装docker:https://docs.docker.com/engine/installation/centos/
  2).初始化
    clone代码后，在根目录执行
    $docker build -t centos-env-6 .
  3).启动容器
    $docker run -t -i centos-env-6 /bin/bash
  4).安装nginx
    $ cd /
    $ cd /app
    $ ./nginx-install.sh
  5.配置JDK,ANT,MAVEN,Resin环境
    $ cd /app
    $ ./download.sh
4.常见问题：
  访问:http://www.faceye.com
