## Kava 4 Test

kava-4-test testnet will use the exported and migrated state from kava-3 at block height 1392000. The validator set from kava-3 will then be swapped for a testing validator set that has sufficient power to start the testnet. This will allow a full testing of the genesis migration from kava-3 to kava-4 and provide additional confidence that the network upgrade will go smoothly.

kava-4-test includes a patch for pruning. On kava-3 the recommended pruning strategy is `nothing`, requiring significant available storage. On kava-4-test all pruning strategies are available, including `pruning="default"`. The pruning config is set in $HOME/.kvd/config/app.toml.

kava-4-test will launch Monday October 12th, 2020 at 14:00 UTC.

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
git checkout v0.11.0-rc2
make install
kvd init --chain-id kava-4-test <your-moniker>
```

To submit your PR, copy the contents of `$HOME/.kvd/config/priv_validator_key.json` to the `keys` folder of this repo, removing the `priv_key` portion. Optionally, include a file called `<name>-peer.txt` that contains the persistent peer information for your node.


### Genesis hash

```
sha256sum $HOME/.kvd/config/genesis.json
# 5c47e6683989b99307a62854e66358a4af0c27e70359236cdd9c4c92b33b57ec
```

### Peers

```
00ca9ce8ee2f8cc633790fbf504569dfc10408c6@185.144.83.141:36656,bf745e13fe6717d50a7375271a8d01a650b4067f@165.22.45.23:26657,5800f9fad43c3caff432d3e554607b0615f1a337@18.223.55.11:26656,c70cbcbf236283221d687e06b61ae62516aa805e@18.191.222.142:26656,a828c76fee9d62cdedd3b296c0253ba7fc0e1292@13.59.110.93:26656
```

### To start the chain

Download the genesis file

```
wget https://raw.githubusercontent.com/Kava-Labs/kava-testnets/master/kava-4-test/genesis.json -O ~/.kvd/config/genesis.json
```

Verify the genesis file

```
sha256sum $HOME/.kvd/config/genesis.json
# 5c47e6683989b99307a62854e66358a4af0c27e70359236cdd9c4c92b33b57ec
```

```
# reset genesis state
kvd unsafe-reset-all
```

```
# or configure to run with systemd, docker, etc
kvd start
```
