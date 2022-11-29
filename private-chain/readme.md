# Run a private chain based on docker-compose

> Important:
>
> 1. In most of the dapp development cases, you DON'T need to run a private chain as a testing environment.
> 2. There are several testnets for you to deploy your contracts for testing, and there are free rpc-services available for you to interact with the chain.
> 3. There are also great development frameworks for the needs to develop a dapp, refer to[ethereum.org development-networks](https://ethereum.org/en/developers/docs/development-networks/) and [ethereum.org development frameworks/](https://ethereum.org/en/developers/docs/frameworks/), one famous and great framework is the [hardhat](https://hardhat.org/)

This demo is under the directory `docker/multi` , and is based on the official docker image of go-ethereum, containing several miner nodes and an ordinary sync-node.

The consensus is not very important for the dapp development, so this demo is just using the `Clique` consensus to run a private chain.

See `docker/multi/README.md` for detail.
