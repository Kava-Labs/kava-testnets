#! /bin/bash

# Remove old config and genesis files
rm -rf ~/.kv*

# install executables
make install

# init testnet chain
kvd init --chain-id=kava-internal-testnet-vesting kava-bootstrap

# Create 1 validator account
printf "validatorpass\n" | kvcli keys add validator
kvd add-genesis-account $(kvcli keys show validator -a) 1000000000000ukava
printf "validatorpass\n" | kvd gentx --name validator --amount 1000000000000ukava

# Create 1 vesting account with a cliff 10 minutes in the future
printf "cliffpass\n" | kvcli keys add cliff
kvd add-genesis-account $(kvcli keys show cliff -a) 100000000000ukava --vesting-amount 100000000000ukava --vesting-end-time $(($(date +%s) + 600))

# Create 1 vesting account with a continous vest until 10 minutes in the future
printf "vestpass\n" | kvcli keys add vest
kvd add-genesis-account $(kvcli keys show vest -a) 100000000000ukava --vesting-amount 100000000000ukava --vesting-end-time $(($(date +%s) + 600)) --vesting-start-time $(date +%s)

# Create 1 'continuous vest' account that has a continuous vest that starts 10 minutes in the future and lasts one hour
printf "contvest\n" | kvcli keys add contvest
kvd add-genesis-account $(kvcli keys show contvest -a) 100000050000ukava --vesting-amount 100000000000ukava --vesting-end-time $(($(date +%s) + 4200)) --vesting-start-time $(($(date +%s) + 600))

# Create 1 'investor' account that has a bit of up front liquidity and a periodic vest that starts 10 minutes in the future and has 2 30 minute vesting periods
printf "investorpass\n" | kvcli keys add investor
kvd add-genesis-account $(kvcli keys show investor -a) 100000050000ukava --vesting-amount 100000000000ukava --vesting-end-time $(($(date +%s) + 4200)) --vesting-start-time $(($(date +%s) + 600)) --vesting-periods-file example.json
# Set params
tmp=$(mktemp)

# bank params
# disable sends
# jq '.app_state.bank.send_enabled = true' ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json

# crisis params
# Denominate crisis fees in ukava
jq '.app_state.crisis.constant_fee.denom = $newVal' --arg newVal "ukava" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# Set value of crisis fee
jq '.app_state.crisis.constant_fee.amount = $newVal' --arg newVal "1333000000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json

# Distribution params
# Disable community fund by setting tax to zero
jq '.app_state.distribution.community_tax = $newVal' --arg newVal "0.000000000000000000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json

# gov params
# Make deposits for proposals in ukava
jq '.app_state.gov.deposit_params.min_deposit[0].denom = $newVal' --arg newVal "ukava" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# set deposit period to 5 minutes (unit: nanosecond)
jq '.app_state.gov.deposit_params.max_deposit_period = $newVal' --arg newVal "300000000000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# set voting period to 10 minutes (unit: nanosecond)
jq '.app_state.gov.voting_params.voting_period = $newVal' --arg newVal "600000000000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json

# mint params
# set initial inflation
jq '.app_state.mint.minter.inflation = $newVal' --arg newVal "0.070000000000000000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# set mint denom
jq '.app_state.mint.params.mint_denom = $newVal' --arg newVal "ukava" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# set expected block time (seconds per year 3.154e+7 / 5001631 = ~6.3 second block time)
jq '.app_state.mint.params.blocks_per_year = $newVal' --arg newVal "5001631" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json

# staking params
# Set staking denom in ukava
jq '.app_state.staking.params.bond_denom = $newVal' --arg newVal "ukava" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# Set unbonding time to 10 minutes (unit: nanosecond)
jq '.app_state.staking.params.unbonding_time = $newVal' --arg newVal "600000000000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json

# Slashing params
# Set signed blocks window to 10000 for liveness slashing
jq '.app_state.slashing.params.signed_blocks_window = $newVal' --arg newVal "10000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# set a minimum of 5% signed blocks per window to avoid slashing
jq '.app_state.slashing.params.min_signed_per_window = $newVal' --arg newVal "0.050000000000000000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# Set liveness slashing to 0.01%
jq '.app_state.slashing.params.slash_fraction_downtime = $newVal' --arg newVal "0.000100000000000000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# Set liveness jail duration to 10 minutes (unit: nanosecond)
jq '.app_state.slashing.params.downtime_jail_duration = $newVal' --arg newVal "600000000000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# Set max evidence age to 10 minutes (unit: nanosecond)
jq '.app_state.slashing.params.max_evidence_age = $newVal' --arg newVal "600000000000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json

# Consensus params
# Set max bytes to 2mb
jq '.consensus_params.block.max_bytes = $newVal' --arg newVal "200000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# Set max gas to 2000000
jq '.consensus_params.block.max_gas = $newVal' --arg newVal "2000000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# Set time_iota_ms to 1000
jq '.consensus_params.block.time_iota_ms = $newVal' --arg newVal "1000" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json
# Set evidence age to 1000000
jq '.consensus_params.evidence.max_age = $newVal' --arg newVal "100" ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json

# Collect gentxs into one genesis file
kvd collect-gentxs

# Set genesis time to current time
jq '.genesis_time = $newVal' --arg newVal $(date '+%FT%H:%M:%SZ') ~/.kvd/config/genesis.json > "$tmp" && mv "$tmp" ~/.kvd/config/genesis.json

# kvd start --trace --log_level "*:debug"

kvd start