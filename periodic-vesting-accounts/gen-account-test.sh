# Remove old config and genesis files
rm -rf ~/.kv*

# install executables
make install

# init testnet chain
kvd init --chain-id=kava-internal-testnet-vesting kava-bootstrap

# Create 1 validator account
printf "validatorpass\n" | kvcli keys add validator
kvd add-genesis-account $(kvcli keys show validator -a) 1000000000000ukava