FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    libpcre3-dev \
    lsb-release \
    software-properties-common \
    apt-transport-https \
    wget \
    git

WORKDIR /git

# get golang
RUN wget https://go.dev/dl/go1.20.1.linux-amd64.tar.gz
RUN tar -zxvf go1.20.1.linux-amd64.tar.gz -C /usr/local/
RUN ln -s /usr/local/go/bin/go /usr/local/bin/go
RUN ln -s /usr/local/go/bin/gofmt /usr/local/bin/gofmt
RUN rm -rf go1.20.1.linux-amd64.tar.gz

# get and install geth
RUN git clone https://github.com/ethereum/go-ethereum.git
RUN cd go-ethereum && make all
RUN ln -s /git/go-ethereum/build/bin/geth /usr/local/bin/geth

# get and install tx-fuzz
RUN git clone https://github.com/infosecual/tx-fuzz
RUN cd tx-fuzz/cmd/livefuzzer && go build ./...
RUN ln -s /git/tx-fuzz/cmd/livefuzzer/livefuzzer /usr/local/bin/livefuzzer

# copy script in and run 
COPY ./scripts /git/scripts
CMD "/git/scripts/start_fuzzed_network.sh"
