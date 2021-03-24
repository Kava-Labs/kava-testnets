## Testnet-12000 Upgrade

On March 25th, at 15:00 UTC, the current testnet will halt due to an upgrade proposal. At that time, validators should take the following steps to upgrade and restart the network


1. Note the final block height that was committed

2. Shutdown the kvd process

```
sudo systemctl stop kvd
```

3. Upgrade kava

```
# from the kava directory
git fetch
git checkout v0.14.0-rc2
make install
```

4. Edit ~/.kvd/config/app.toml

```
# Set unsafe-skip-upgrades to be the final committed height + 1. For example, if the final committed height was 49999:
unsafe-skip-upgrades=[50000]
```

5. Restart node

```
sudo systemctl start kvd
```


We will coordinate in discord at the upgrade time to ensure the chain restarts promptly.
