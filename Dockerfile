################ CentOS Base Java Develop Docker ################
#Desc:Docker of CentOS for Java App Run
#Include:
#1).CentOS
#2).JDK,1.7
#3).Nginx:1.9.9
#4).Ant:1.9.6
#5).Maven:3.3.3
#Write By :haipenge@gmail.com
#Date:2016.01.15
#################################################################
#From centos:version
FROM centos:6
MAINTAINER docker_user haipenge@gmail.com
######################## SET Env version info ############################
#ENV ANT_VERSION=1.9.6
#ENV M2_VERSION=3.3.3
#ENV JDK_VERSION=1.7.0_80
#ENV RESIN_VERSION=4.0.44
######################## End Version Config ##############################
RUN yum update -y && \
 yum install -y epel-release && \
 yum  install -y gcc automake autoconf libtool make gcc-c++ passwd iproute python-setuptools hostname inotify-tools yum-utils which wget curl openssh-server git
RUN easy_install supervisor
RUN echo "root:root" | chpasswd
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
# Bad security, add a user and sudo instead!
#RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
# http://stackoverflow.com/questions/18173889/cannot-access-centos-sshd-on-docker
#RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
#RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
#chkconfig sshd on
######################## Init System Dirs ################################
RUN mkdir -p /app /app/ant /app/maven /app/jdk /app/resin /var/run/sshd /var/log/supervisor
######################## End Init System Dirs ############################

####################Start 2 Add Extenl File ############################
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY supervisord.conf /etc/supervisord.conf
COPY bootstrap.sh /app
COPY download.sh /app
COPY nginx.conf /app
COPY resin.xml /app
COPY resin.properties /app
COPY nginx-install.sh /app

#ADD apache-maven-$M2_VERSION-bin.tar.gz /app/maven
#ADD apache-ant-$ANT_VERSION-bin.tar.gz /app/ant
#ADD jdk-7u80-linux-x64.tar.gz /app/jdk
#ADD resin-$ENV RESIN_VERSION.tar.gz /app/resin
#################### End Add Files #####################################
# expose httpd port
#EXPOSE 80
EXPOSE 22 80
#################### SET Environment ###################################
#ENV ANT_HOME /app/ant/apache-ant-$ANT_VERSION
#ENV M2_HOME /app/maven/apache-maven-$M2_VERSION
#ENV JAVA_HOME /app/jdk/jdk$JDK_VERSION
#ENV PATH $ANT_HOME/bin:$PATH
#ENV PATH $M2_HOME/bin:$PATH
#ENV PATH $JAVA_HOME/bin:$PATH
#ENV CLASSPATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
#################### End Environment config ############################
VOLUME ["/data","/data/log","/data/deploy","/data/tools"]
# the command to run
#ENTRYPOINT ["/app/nginx-install.sh"]
CMD ["/usr/bin/supervisord"]
#EDN