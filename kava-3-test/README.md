## Kava 3 Test

kava-3-test testnet will use the exported and migrated state from kava-2 at block height 2500000. The validator set from kava-2 will then be swapped for a testing validator set that has sufficient power to start the testnet. This will allow a full testing of the genesis migration from kava-2 to kava-3 and provide additional confidence that the network upgrade will go smoothly.

kava-3-test will launch Friday June 5th, 2020 at 14:00 UTC.

## Instructions for participants

If you would like to participate, you will need to submit the public key portion of a validator consensus key. An example key looks like

```json
{
  "address": "EE66D876DA7C92FB8A829E3F28DFD04C64236D21",
  "pub_key": {
    "type": "tendermint/PubKeyEd25519",
    "value": "3l46vwRdqH1fQjDazQ303viXkOU98iXs0mGoEsi0Amg="
  }
}
```

To install and initialize the software:

```
git clone https://github.com/kava-labs/kava
cd kava
git checkout ro-add-v0.8-migration
kvd init --chain-id kava-3-test <your-moniker>
```

To submit your PR, copy the contents of `$HOME/.kvd/config/priv_validator_key.json` to the `keys` folder of this repo, removing the `priv_key` portion. Optionally, include a file called `<name>-peer.txt` that contains the persistent peer information for your node.


### Genesis hash

```
sha256sum genesis.json
# d8090e604b6afff0ba7f1b6b4deafcff7968b4c4471c04ee8be3fbf8220a93e3
```

### Peers

```
d747825ea8a6ffa8c5ae7736322b323a056996d1@13.124.101.116:26657,f86bcb3827822a8b74afff4830c28e2224c527ad@3.218.154.47:26656,1c145d916ab95e946bd550c34ca2a5e596e592c8@37.221.195.2:26656,2a9d4bfebd3612de833be2e7438f4fc1710b5d3c@52.74.38.107:26656,590ed10458fe5db9640ac4d4be4207b8df90c064@34.231.247.21:26656
```

### To start the chain

Download the genesis file

```
wget https://raw.githubusercontent.com/Kava-Labs/kava-testnets/master/kava-3-test/genesis.json -O $HOME/.kvd/config/genesis.json
```

Verify the genesis file

```
sha256sum $HOME/.kvd/config/genesis.json
# d8090e604b6afff0ba7f1b6b4deafcff7968b4c4471c04ee8be3fbf8220a93e3
```

```
# or configure to run with systemd, etc
kvd start
```
