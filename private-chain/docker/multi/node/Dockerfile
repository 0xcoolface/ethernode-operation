FROM ethereum/client-go:stable
WORKDIR "/root"
ADD ./set_up_file/genesis.json  ./genesis.json
ADD ./node/config.toml  ./config.toml

RUN mkdir -p ./keystore \
&& mkdir -p ./data 

ARG password
ARG privatekey
RUN echo $password > ./.accountpassword
RUN echo $privatekey > ./.privatekey


RUN geth init ./genesis.json
RUN geth account import --password ./.accountpassword  ./.privatekey

ENV address=""

ENTRYPOINT ["geth","--config","config.toml","--allow-insecure-unlock"]
CMD ["--metrics","--metrics.addr", "0.0.0.0","--metrics.port","19090"]

EXPOSE 8545 8546 30303 30303/udp 19090
