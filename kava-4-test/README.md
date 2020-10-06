## Kava 4 Test

kava-4-test testnet will use the exported and migrated state from kava-3 at block height 1392000. The validator set from kava-3 will then be swapped for a testing validator set that has sufficient power to start the testnet. This will allow a full testing of the genesis migration from kava-3 to kava-4 and provide additional confidence that the network upgrade will go smoothly.

kava-4-test will launch Thursday October 8th, 2020 at 14:00 UTC.

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
git checkout v0.11.0-rc1
kvd init --chain-id kava-4-test <your-moniker>
```

To submit your PR, copy the contents of `$HOME/.kvd/config/priv_validator_key.json` to the `keys` folder of this repo, removing the `priv_key` portion. Optionally, include a file called `<name>-peer.txt` that contains the persistent peer information for your node.


### Genesis hash

```
TBD
```

### Peers

```
TBD
```

### To start the chain

Download the genesis file

```
TBD
```

Verify the genesis file

```
sha256sum $HOME/.kvd/config/genesis.json
# TBD
```

```
# reset genesis state
kvd unsafe-reset-all
```

```
# or configure to run with systemd, docker, etc
kvd start
```
