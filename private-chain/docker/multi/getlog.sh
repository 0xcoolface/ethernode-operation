#! /bin/sh
docker-compose logs --no-color > chain.log
grep "geth-miner-1" chain.log > geth-miner-1.log
grep "geth-miner-2" chain.log > geth-miner-2.log
grep "geth-miner-3" chain.log > geth-miner-3.log
# grep "geth-miner-4" chain.log > geth-miner-4.log
# grep "geth-miner-5" chain.log > geth-miner-5.log
grep "geth-node" chain.log > geth-node.log