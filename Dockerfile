FROM gradle:6.6-jdk11

RUN apt-get update \
      && apt-get upgrade --yes \
      && apt-get install --yes curl gnupg openjdk-11-jdk git sshpass unzip ca-certificates wget \
      && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
      && update-ca-certificates \
      && echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" >> /etc/apt/sources.list \
      && apt-get update 


# Download and extract gradle & docker
RUN apt-get install --yes docker-ce \