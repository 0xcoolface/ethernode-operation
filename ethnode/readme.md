# Run an ethereum node

[ethereum.org run-a-node](https://ethereum.org/en/developers/docs/nodes-and-clients/run-a-node/)

<https://ethereum.org/en/run-a-node>

## 1 Run a node by mannual

This project is a demo to run an Ethereum node manually. Specifically, we will run a node of the `sepolia` testnet, and it will be very easy to change the scripts to run a mainnet node, just by changing a few options and configs. Mainly as follows:

- changing the options `--sepolia` in both `start.sh` files to `--mainnet`;
- download and use the mainnet's `genesis.ssz` file for the consensus client;
- update the `datadir` to a directory for the mainnet for both clients; 
- using a config file of the geth client for the mainnet, which can be modified from `sepolia.toml`, or generate a new one and then config it according to your needs.

An Ethereum node consists of a consensus node and an execution node.

For the consensus node, we recommend the `prysm` implementation for new users, since it has very friendly documents.

For the execution node, the `geth` is the first choice.

> Notice: Both for the consensus and the execution layer, there are several clients one can choose from.

### Consensus client: prysm

Refer to prysm docs [install-with-script](https://docs.prylabs.network/docs/install/install-with-script)

#### Prerequisite

Need the `gpg` to verify the `prysm` binary.
If you don't want to do the verification, then set an environment `PRYSM_ALLOW_UNVERIFIED_BINARIES=1`

#### Basic steps

1. Make a directory, download the `prysm` scripts

```shell
mkdir prysm && cd prysm
curl https://raw.githubusercontent.com/prysmaticlabs/prysm/master/prysm.sh --output prysm.sh && chmod +x prysm.sh
```

2. Generate a JWT Secret, which is used to auth the comunication between the consensus client and the execution client.

```shell
./prysm.sh beacon-chain generate-auth-secret
```

3. download the `genesis.ssz`

For sepolia:

```shell
curl https://raw.githubusercontent.com/eth-clients/merge-testnets/main/sepolia/genesis.ssz --output genesis.ssz
```

4. Start the consensus node, refer to `./consensus/prysm/start.sh`

```shell
./prysm.sh beacon-chain --execution-endpoint=http://localhost:8551 --sepolia --jwt-secret=jwt.hex --genesis-state=genesis.ssz
```

Or start the node with a config file, refer to `./consensus/prysm/start-with-config-file.sh`. It's the same.

> If you want to run a node for a validator, then there're some more steps and configs, you need to refer to the docs and fully understand the `Best practices`.

### Execution client: geth

[command line options](https://geth.ethereum.org/docs/interface/command-line-options)

Just in the `prysm`'s docs, there are some information about runing `geth`.

#### Basic steps

1. download the precompiled binaries acording to your OS: <https://geth.ethereum.org/downloads/>
2. refer to `execution/sepolia.toml`, modify the options as you need, take care about the `NetworkId` and `DataDir`.

or you can dump the config file and then modify it, as follow:

```shell
geth --sepolia --datadir sepolia dumpconfig > config.toml
```

3. copy the the `jwt.hex` for `geth`.
4. start the node, refer to `execution/start.sh`.


## 2 Other choice: Guided setup

### dappnode

<https://docs.dappnode.io/get-started/installation/custom-hardware/installation/script>


### eth-docker

<https://eth-docker.net/Usage>
