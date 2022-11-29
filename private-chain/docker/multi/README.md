# deploy a private chain using docker-compose

Currently the used consensus is `clique`.

## Prerequisites

```shell
docker pull ethereum/client-go:stable
```

## config

Prepare your config file, and the docker-compose.yml, which is relate to how much nodes do you want to run and each miner's key and address.

And then you should set the `extra` field in the `genesis.json`, with the data format as:
`[32 bytes vanity][20 bytes miner 1 address][miner... address][65 bytes 0]`

> The node keys is recorded at `nodekeys.txt`

## run

When all config is fine, then you can run up your private chain:

```shell
docker-compose up --build -d
```

## the accounts in the current genesis.json 

|address     |privatekey      |publickey|
|--|--|--|
|0x3a696FeAe901DAe50967F28D7A2225577052F394      |ebaa2febee077847f41b9bd23b28ba7318f37d92658ccbe194a2df432a93810f        |04aa560ea7a3a11bb3831a7f461132e5d8f6928de996784367575e25be66b775e1fcd4dac12e127c8596ea3fbe8bcd6b8ef87800233683c3074b292f68f8cdf763|
|0xa27D573683766F78A818F169C20E287149D26b09      |5e9561af4f2963911d4c04c0fe830666f57b0d87f9bd24ffc4f65aad2a2c2de1|        040fef6aa67ec70a8741d7524db255145fe6dd052e572aa92af5d447a813458ae278073beeb576da21304bfe4a8c84f990c1e84a2b5f39bb12d8f635b96e8642e6|

## some usefull commands

```shell
docker-compose up --build -d

docker-compose down
```

get logs:

```shell
docker-compose logs --no-color > chain.log
```

enter the running container:

```shell
docker-compose exec -- geth-node sh
```

directory attach the geth.ipc and run a query:

```shell
docker-compose exec -- geth-miner-1 geth attach --exec eth.blockNumber  /root/.ethereum/geth.ipc

docker-compose exec -- geth-miner-1 geth attach --exec 'eth.getBlockByNumber("0x1",false)' /root/.ethereum/geth.ipc
```

using json rpc:

```shell
curl --location --request POST 'localhost:8545' --header 'Content-Type: application/json' --data-raw '{"jsonrpc": "2.0","method": "eth_blockNumber","params": [],"id": 83}'
```
