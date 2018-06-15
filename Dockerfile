FROM centos:7
MAINTAINER AdamRushad <2429990+adamrushad@users.noreply.github.com>

#Install
RUN yum -y install java-1.8.0-openjdk-headless && yum clean all

# Entrypoint
COPY ./jenkins-slave /usr/local/bin/jenkins-slave
ENTRYPOINT ["/jenkins-slave"]

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="Basic CentOS Jenkins Slave" \
  org.label-schema.description="Barebones CentOS Jenkins JNLP Slave" \
  org.label-schema.url="https://github.com/adamrushad/centos-jnlp-slave/" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/adamrushad/centos-jnlp-slave" \
  org.label-schema.version=$VERSION \
  org.label-schema.schema-version="1.0"
