# Testnet 3000 Genesis Parameters

This genesis time puts nighttime in the pacific (early-ish for San Francisco and late-ish for Korea: [Timezone chart](https://www.timeanddate.com/worldclock/meetingtime.html?iso=20190801&p1=224&p2=43&p3=136&p4=37&p5=33&p6=235)).

    "genesis_time": "2019-10-03T14:00:00Z",
    "chain_id": "kava-testnet-3000",

These are the same as cosmos hub 3 and 2. hub 1 was slightly different.

    "consensus_params": {
        "block": {
            "max_bytes": "200000",
            "max_gas": "2000000",
            "time_iota_ms": "1000"
        },
        "evidence": {
            "max_age": "1000000"
        },
        "validator": {
            "pub_key_types": [
                "ed25519"
            ]
        }
    },

## App State

### Bank

Start with txs disabled and use governance to enable them.
Note: faucet won't work.

    "bank": {
        "send_enabled": false
    },

### Genutil

Normal list of gentxs generated automatically

    "genutil": {
        "gentxs": [...]
    },

### Crisis

Currently set to cosmos hub 3 and 2 's value. Reference:
[https://github.com/cosmos/cosmos-sdk/tree/master/x/crisis/spec](https://github.com/cosmos/cosmos-sdk/tree/master/x/crisis/spec)

    "crisis": {
        "constant_fee": {
            "denom": "ukava",
            "amount": "1333000000"
        }
    },

### Distribution

Main params are the same as cosmos hub 3 and 2 except community pool, and withdraw address.
`withdraw_addr_enabled` should be set when txs are enabled
Disable community pool by setting tax to 0.

    "distribution": {
        "fee_pool": {
            "community_pool": []
        },
        "community_tax": "0.000000000000000000",
        "base_proposer_reward": "0.010000000000000000",
        "bonus_proposer_reward": "0.040000000000000000",
        "withdraw_addr_enabled": false,
        "delegator_withdraw_infos": [],
        "previous_proposer": "",
        "outstanding_rewards": [],
        "validator_accumulated_commissions": [],
        "validator_historical_rewards": [],
        "validator_current_rewards": [],
        "delegator_starting_infos": [],
        "validator_slash_events": []
    },

### Mint

Mint has same parameters as hubs 1, 2, and 3 except

- `block_per_year` calculated from test 2000 block time (6.24s per block, 365.25 days/year)
- `inflation` which is just the initial value for inflation, set to the min, as hub 1 did
ref: [https://github.com/cosmos/cosmos-sdk/issues/2846](https://github.com/cosmos/cosmos-sdk/issues/2846)
`annual_provisions` is fine to start at zero, the setting here is just the initial value. It gets computed each block from the inflation percentage and the total supply.

    "mint": {
        "minter": {
            "inflation": "0.070000000000000000",
            "annual_provisions": "0.000000000000000000"
        },
        "params": {
            "mint_denom": "ukava",
            "inflation_rate_change": "0.130000000000000000",
            "inflation_max": "0.200000000000000000",
            "inflation_min": "0.070000000000000000",
            "goal_bonded": "0.670000000000000000",
            "blocks_per_year": "5057308"
        }
    },

### Auth

Same params as hub 3, 2, and 1. But now accounts are stored under `auth` rather than `genaccounts`

    "auth": {
        "params": {
            "max_memo_characters": "512",
            "tx_sig_limit": "7",
            "tx_size_cost_per_byte": "10",
            "sig_verify_cost_ed25519": "590",
            "sig_verify_cost_secp256k1": "1000"
        }
        "accounts": [...]
    },

### Params

`params` has no genesis state

    "params": null

### Gov

Same params as the cosmos hubs except `voting_period` is capped by the unbonding time, and `deposit_period` is a week to better match testnet timelines.
Note: voting period must be less than unbonding period otherwise people could vote, redelegate, then vote again.

    "gov": {
        "starting_proposal_id": "1",
        "deposits": null,
        "votes": null,
        "proposals": null,
        "deposit_params": {
            "min_deposit": [
                {
                    "denom": "ukava",
                    "amount": "512000000"
                }
                ],
            "max_deposit_period": "604800000000000" // 1 week
        },
        "voting_params": {
            "voting_period": "259200000000000" // 3 days, has to be ≤ unbonding time
        },
        "tally_params": {
            "quorum": "0.400000000000000000",
            "threshold": "0.500000000000000000",
            "veto": "0.334000000000000000"
        }
    },

### Staking

Params same as hub 3, 2, and 1 except for unbonding time which is 3 days.
(gaia testnet 13k used 3 days)

    "staking": {
        "params": {
            "unbonding_time": "259200000000000", // 3 days
            "max_validators": 100,
            "max_entries": 7,
            "bond_denom": "ukava"
        },
        "last_total_power": "0",
        "last_validator_powers": null,
        "validators": null,
        "delegations": null,
        "unbonding_delegations": null,
        "redelegations": null,
        "exported": false
    },

### Slashing

Currently all the same cosmos hub 3, 2, and 1 except `max_evidence_age` which is set to the staking unbonding time

    "slashing": {
        "params": {
            "max_evidence_age": "259200000000000", // 3 days, must be same as unbonding period
            "signed_blocks_window": "10000", // 17.33hrs hours @ 6.24s block time (block time of testnet 2000)
            "min_signed_per_window": "0.050000000000000000", // can be down for up to 16.46hrs without slashing
            "downtime_jail_duration": "600000000000", // 10min
            "slash_fraction_double_sign": "0.050000000000000000",
            "slash_fraction_downtime": "0.000100000000000000"
        },
        "signing_infos": {},
        "missed_blocks": {}
    },

### Supply

Note: neither `add-genesis-account` or `collect-gentx` modifies the supply. If it's empty here, then it's set when the chain starts based on the accounts.

    "supply": {
        "supply": {
            "total": []
        }
    }
