#!/usr/bin/env bash
./prysm.sh beacon-chain \
--sepolia \
--datadir sepolia \
--restore-target-dir sepolia \
--execution-endpoint=http://localhost:8551 \
--jwt-secret=jwt.hex \
--genesis-state=genesis.ssz