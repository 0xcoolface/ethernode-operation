#!/usr/bin/env bash
./geth \
--config sepolia.toml  \
--sepolia --override.terminaltotaldifficulty 17000000000000000  >> ./logs/sepolia_console.log 2>&1
