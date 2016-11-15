FROM centos:7

MAINTAINER Girish Verma <gverma10@sapient.com>

RUN yum update -y
RUN yum install -y wget
RUN yum install -y java
RUN yum clean all

RUN mkdir /home/jmeter
RUN cd /home/jmeter/

RUN wget http://apache-mirror.rbc.ru/pub/apache/jmeter/binaries/apache-jmeter-3.0.tgz

RUN tar -xzf apache-jmeter-3.0.tgz
RUN rm -rf apache-jmeter-3.0.tgz

ADD PSST_Demo_Test.jmx /home/jmeter/PSST_Demo_Test.jmx

EXPOSE 1099

CMD /apache-jmeter-3.0/bin/jmeter.sh -n -t /home/jmeter/PSST_Demo_Test.jmx -l /home/jmeter/PSST_Demo_Results.csv

