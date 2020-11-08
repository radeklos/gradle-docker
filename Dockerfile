FROM gradle:6.6-jdk11

## 1
RUN apt-get update && apt-get install -y git
RUN cd /opt && git clone https://github.com/docker/docker-ce
RUN cd /opt/docker-ce && git checkout -b v18.06.3-ce
RUN cd /opt && git clone https://github.com/docker/docker-ce-packaging.git


## 2
# RUN apt-get update -qq && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common

# install docker-ce
# RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
#	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
#	apt-get update -qq && apt-get install docker-ce -y

## 3

# RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
#	apt-get update && \
#	apt-cache policy docker-ce && \  
#	apt-get install -y docker-ce  


## 4

RUN set -ex \
      && apt-get update \
      && apt-get upgrade --yes \
      && apt-get install --yes curl gnupg openjdk-11-jdk git sshpass unzip ca-certificates wget \
      && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
      && update-ca-certificates \
      && echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" >> /etc/apt/sources.list \
      && apt-get update 


# Download and extract gradle & docker
RUN set -ex \
      && apt-get install --yes docker-ce \