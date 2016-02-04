FROM jenkins:1.609.1

MAINTAINER alexperto

USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log"
