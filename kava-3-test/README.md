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

To submit your PR, copy the contents of `$HOME/.kvd/config/priv_validator_key.json` to the `keys` folder of this repo, removing the `priv_key` portion. Optionally, include a file called '<name>-peer.txt' that contains the persistent peer information for your node.
