# Kava Testnet 7000

A minor bug in kava `v0.8.1` was discovered that prevents the bep3 asset supply from inheriting changes from the bep3 parameters. The patch to this bug is a breaking change and the Kava mainnet will undergo an asynchronous network fork to implement the bugfix. Because it is a breaking change being deployed to mainnet, it is essential that the code is thoroughly reviewed and tested in a production-like setting. The corresponding bugfix PR can be found [here](https://github.com/Kava-Labs/kava/pull/604). The purpose of this testnet is to allow validators to test the patch and ensure that the following conditions are met:

1. That v0.9 fixes the bug (ie, increasing the asset limit in the bep3 parameters also increases the asset's supply, allowing new transfers to take place)
2. That nodes running v0.8 will fork off at the specified activation time, **but not before**.
3. Prior to activation time, there are no conflicts between v0.8 nodes and v0.9 nodes (ie, neither v0.8 nodes nor v0.9 experience panics prior to activation time).
4. After activation, a fresh installation of v0.9 can successfully sync from genesis (ie, the changes in v0.9 do not make syncing impossible)

## Participation

To simulate realistic network conditions, most validators should run [`v0.9.0-rc1`](https://github.com/Kava-Labs/kava/releases/tag/v0.9.0-rc1) and a minority should run [`v0.8.1`](https://github.com/Kava-Labs/kava/releases/tag/v0.8.1). You can submit a gentx for one or both of the following:

### v0.9 gentx submissions

1. Build `v0.9.0-rc1` of kava with chain-id `kava-testnet-7000`
2. Submit a genesis transaction as a pull request in `kava-testnets/7000/gentxs` for 1000000000000ukava
3. Download the genesis file when it is published and start you node with `v0.9.0-rc1` installed

### v0.8 gentx submissions

1. Build `v0.8.1` of kava with chain-id `kava-testnet-7000`
2. Submit a genesis transaction as a pull request in `kava-testnets/7000/gentxs` for 100000000000ukava
3. Download the genesis file when it is published and start you node with `v0.8.1` installed

## Launch time

The testnet will launch on Wednesday July 1st, 2020 at 14:00 UTC. The activation time for the bugfix will be July 2nd, 2020 at 14:00 UTC.

## Verification

Nodes running `v0.8.1` should successfully follow the chain until July 2nd, 14:00 UTC, at which point it will fail with a 'Consensus Failure' error message. Nodes running `v0.9.0-rc1` should continue making blocks after the activation time is reached. After activation time, try syncing a node from genesis that is running `v0.9.0-rc1` of the kava software. It should successfully sync to the tip of the chain. Further, you can monitor the bep3 parameters and supply, to ensure that the updates to supply take place as expected and do not cause errors with swaps. If any failures are discovered, file an issue on the main kava repository.

## Genesis hash

```sh
sha256sum genesis.json
69f45a7ee56820573b17161782bf9b66cd3805dcccfa6376963a9e5fae6ad21e
```

## Peers

```sh
77120e4166fa56b627348a8eb54f4aecbc28131e@18.219.103.38:26656,bce7ebd409182006f782e06e2320db464936cd19@184.169.230.232:26656,2f207bcae54fb29c0b3e8757ee486347b4481ed8@3.23.104.193:26656
```
