FROM tomcat:latest
LABEL maintainer="saichandu5"
ENV /var/lib/jenkins/workspace/pp=JENKINS_WORKSPACE
ADD $JENKINS_WORKSPACE/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
