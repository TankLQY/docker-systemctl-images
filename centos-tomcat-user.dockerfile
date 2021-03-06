FROM centos:7.7.1908

LABEL __copyright__="(C) Guido U. Draheim, licensed under the EUPL" \
      __version__="1.4.4147"
EXPOSE 8080

RUN yum search tomcat
RUN yum install -y tomcat tomcat-webapps
COPY files/docker/systemctl.py /usr/bin/systemctl

RUN systemctl enable tomcat
CMD /usr/bin/systemctl
USER tomcat
# tomcat.service does already contain a "User=" entry
