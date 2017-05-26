#########################################################################################
# This dockerfile is derived from loicmathieu/cloudera-cdh and will setup an edge node to
# works with the other cloudera containers.
# It also contains some pig/hive script and CSV test files to start with
#
#########################################################################################
FROM dfossouo/cloudera:5.9.0

MAINTAINER Donald FOSSOUO <fossouodonald@gmail.com>

#install pig, hive, flume and scoop 
RUN yum -y install pig hive flume-ng sqoop2 spark-worker && rm -rf /var/cache/yum/*

#copy test data and script
COPY cities.* /

#setup supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#copy flume conf and start scripts
COPY flume/* /
RUN chmod +x /start_flume.sh

#create a staging disk to send/get data to/from the clusrer
RUN mkdir /staging

VOLUME /staging

## Install net-tools wget bzip2 -- debug and anaconda need
RUN yum install net-tools wget bzip2 -y
RUN wget -q -O /tmp/Anaconda3-4.3.1-Linux-x86_64.sh https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh && bash /tmp/Anaconda3-4.3.1-Linux-x86_64.sh -b -p /opt/anaconda3

# Launch Notebook


CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
