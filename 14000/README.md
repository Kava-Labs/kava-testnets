# Kava Testnet 14000

This testnet will be the second public testnet in preparation for the `kava-9` mainnet release. If you are a kava mainnet validator, it is strongly encouraged that you participate.

Please put gentxs in the `gentxs` folder within this directory. Gentxs will be accepted until Friday, Jan 7 at 16:00 UTC. The genesis file will be published shortly after that. 

## TLDR to submit a gentx:

**Note:** the cosmos-sdk version for kava-9 has been updated to `v0.44.x` - this means that the kava binary (formerly `kvd`) and kava command-line interface (formerly `kvcli`) have been combined into a single binary (`kava`). After running `make install`, all commands can be executed with the `kava` binary (ie `kava gentx <key-name> 1000000000000ukava --chain-id kava-testnet-14000 --keyring-backend test`)

```
chain-id: kava-testnet-14000
gentx-amount: 1000000000000ukava
kava version: v0.16.0-alpha.0
genesis-time: 2022-01-07T23:00:00Z
```

## Genesis Details

```
genesis hash: [PLACEHOLDER]
seeds: [PLACEHOLDER]
persistent peers: [PLACEHOLDER]
```