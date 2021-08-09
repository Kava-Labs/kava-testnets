## Kava 3 Relaunch

This testnet uses the exported and migrated state from kava-2 at block height 2500000 and is meant for validators to test their setups in preparation for kava-3. To join, download the genesis file and setup a validator. Faucet coins can be obtained from the account
kava1s2fljy7ul5rxmjv6mdrm29zvk0aaskngugsavy. The mnemonic is

```sh
predict melt analyst destroy outer random uncle poet duck lion alert moment assume meadow surprise alarm soccer human chair lake zoo eyebrow film erase
```


### Genesis hash

```
sha256sum genesis.json
# 258b46e9f4d7918759c41d970fb12e2c295ec2050ca58a047e4f5a9fd62effe2
```

### Peers

```
5cbc4113530e68b33a6751a7fde3bfc5f80130c9@18.191.19.210:26656,6a17ecdfcb20ce9c6364284ddbbba995e6489b55@18.216.43.144:26656,29c086f110a30eecb9bbda850944167c5b7e8778@18.225.11.134:26656,f1e380fa7a97b47ed6976aca5e11b4205bb0df7b@3.19.72.9:26656,5c70cf17ac5403f04f2818bc02a88c8bd2214ee7@18.221.51.38:26656,49bdcc4823e181ab1a929cecb6e51f2b3d213b82@52.15.75.9:26656,097f8a1ed4423e76229d59922404e3659c44448a@3.18.106.82:26656,bb340d7523b9a2f0439679ef68c386e43fcc07aa@18.224.182.139:26656
```

### To start the chain

Download the genesis file

```
wget https://raw.githubusercontent.com/Kava-Labs/kava-testnets/master/kava-3-relaunch/genesis.json -O $HOME/.kvd/config/genesis.json
```

Verify the genesis file

```
sha256sum $HOME/.kvd/config/genesis.json
# 258b46e9f4d7918759c41d970fb12e2c295ec2050ca58a047e4f5a9fd62effe2
```

```
# or configure to run with systemd, etc
kvd start
```
