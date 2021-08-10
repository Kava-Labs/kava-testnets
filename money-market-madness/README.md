## Money Market Madness Testnet

We are ready for gentx submissions for money-market-madness. Note that this is an alpha-testing network, so please only participate as a launch validator if you have time to update your node if there is a panic and we have to relaunch the network in the next couple of days/weeks. Future testnets for kava-5 will be more stable.


TLDR to submit a gentx:

```
chain-id: money-market-madness
gentx-amount: 1000000000000ukava
kava version (branch): kava-5-pre-mmm
genesis-time: 2021-02-11T15:00:00Z
```

Please put gentxs in the `gentxs` folder within this repository.


## Launch details

**NOTE: Please pull the latest changes into `kava-5-pre-mmm` and re-install kvd before starting your validator.**

```
genesis file hash: eec441cf2149dfc36283411f9552325fceb5691120c6201b1ba59befcc067ac8
seeds: "9a07c0acb527f96273dabea8726164500b20ce6e@52.6.22.66:26656"
persistent_peers: "1f8d4fb19c0754dd801230f546865fa1ac533909@34.239.152.196:26656,2f3d3c7bbc6cc0cea32048063de5f787cbdfc5d6@52.5.145.97:26656,f453bf3c1af94d2a5a3a987ee486e61d29f3ce7c@54.163.14.59:26656"
```
