FROM tomcat:9-jre11
LABEL Author="Cathy NAVARRO"
EXPOSE 8081
COPY target/* /usr/local/tomcat/webapps/
COPY target/nanasenseimvc.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
