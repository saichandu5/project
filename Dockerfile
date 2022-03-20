FROM tomcat:latest
LABEL maintainer="saichandu5"
ENV JENKINS_WORKSPACE=/var/lib/jenkins/workspace/pp
ADD ${JENKINS_WORKSPACE}/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
