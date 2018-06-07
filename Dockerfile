FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl

# download and install acs-engine
RUN curl -LO https://github.com/Azure/acs-engine/releases/download/v0.18.1/acs-engine-v0.18.1-linux-amd64.tar.gz
RUN tar -xvf acs-engine-v0.18.1-linux-amd64.tar.gz
RUN mv acs-engine-v0.18.1-linux-amd64/acs-engine /usr/local/bin/acs-engine
RUN chmod +x /usr/local/bin/acs-engine

# copy apimodel.json and generate.sh inside the container
COPY . .
RUN chmod +x generate.sh

# entrypoint
ENTRYPOINT [ "/generate.sh" ]
