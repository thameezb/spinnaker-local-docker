FROM us-docker.pkg.dev/spinnaker-community/docker/halyard:stable-ubuntu

USER root
RUN apt-get update && \
  apt-get install -y git openssh-client npm net-tools curl sudo openjdk-11-jdk && \
  npm install -g yarn

RUN apt-get install netcat -y && npm install -g n && n v16.16.0

USER spinnaker
COPY ./run.sh /home/spinnaker/run.sh
WORKDIR /home/spinnaker

CMD ["/opt/halyard/bin/halyard"]