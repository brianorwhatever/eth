FROM ubuntu:latest

WORKDIR /code

# Install geth
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get update
RUN apt-get install -y ethereum

# Setup
ADD genesis.json /code

CMD ["bash"]