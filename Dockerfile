FROM centos:7

MAINTAINER Girish Verma <gverma10@sapient.com>

RUN yum install -y java;yum clean all

RUN mkdir /home/jmeter
ADD apache-jmeter-3.0.tgz /home/jmeter/
ADD PSST_Demo_Test.jmx /home/jmeter/PSST_Demo_Test.jmx

CMD cd /home/jmeter; tar -xzf /home/jmeter/apache-jmeter-3.0.tgz
CMD /home/jmeter/apache-jmeter-3.0/bin/jmeter.sh -n -t /home/jmeter/PSST_Demo_Test.jmx -l /home/jmeter/UnileverResults.jtl -JREPORT_DIR_PATH=./reports/ -q /home/jmeter/apache-jmeter-3.0/bin/jmeter.properties
