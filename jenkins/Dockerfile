FROM jenkins/jenkins:lts-jdk21

USER root

RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    curl \
    git \
    unzip \
    rsync \
    openssh-client && \
    update-ca-certificates

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

ENV JENKINS_UC=https://updates.jenkins.io
ENV JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental
ENV JENKINS_INCREMENTALS_REPO_MIRROR=https://repo.jenkins-ci.org/incrementals

RUN jenkins-plugin-cli \
    --latest true \
    --plugin-file /usr/share/jenkins/ref/plugins.txt
