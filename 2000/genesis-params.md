[Timezone chart](https://www.timeanddate.com/worldclock/meetingtime.html?iso=20190801&p1=224&p2=43&p3=136&p4=37&p5=33&p6=235) <br>
This time puts nighttime in the pacific (earlyish for SF, lateish for Korea).

    "genesis_time": "2019-07-31T14:00:00Z",
    "chain_id": "kava-testnet-2",

These are the same as cosmoshub-2. hub 1 was slightly different.

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


Start with txs disabled and use governance to enable them.
Note: faucet won't work.

    "bank": {
        "send_enabled": false
    },

Normal list of gentxs generated automatically

    "genutil": {
        "gentxs": [...]
    },

Currently set to cosmoshub-2's value
https://github.com/cosmos/cosmos-sdk/tree/master/docs/spec/crisis

    "crisis": {
        "constant_fee": {
            "denom": "ukava",
            "amount": "1333000000"
        }
    },

Main params are the same as cosmoshub 2 except community pool.
Disable community pool by setting tax to 0.

    "distribution": {
        "fee_pool": {
            "community_pool": []
        },
        "community_tax": "0.000000000000000000",
        "base_proposer_reward": "0.010000000000000000",
        "bonus_proposer_reward": "0.040000000000000000",
        "withdraw_addr_enabled": true,
        "delegator_withdraw_infos": [],
        "previous_proposer": "",
        "outstanding_rewards": [],
        "validator_accumulated_commissions": [],
        "validator_historical_rewards": [],
        "validator_current_rewards": [],
        "delegator_starting_infos": [],
        "validator_slash_events": []
    },

Mint has same parameters as hubs 1 and 2 except
 - `block_per_year` calculated from test 1.1 block time (6.13s)
 - `inflation` which is just the initial value for inflation, set to the min as hub 1 did
ref: https://github.com/cosmos/cosmos-sdk/issues/2846 <br>
`annual_provisions` is fine to start at zero, the setting here is just the initial value. It gets computed each block from the inflation pct and the total supply.

```
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
            "blocks_per_year": "5001631"
        }
    },
```

Same params as hub 1 & 2

    "auth": {
        "params": {
            "max_memo_characters": "512",
            "tx_sig_limit": "7",
            "tx_size_cost_per_byte": "10",
            "sig_verify_cost_ed25519": "590",
            "sig_verify_cost_secp256k1": "1000"
        }
    },

New for v0.36. x/params has no genesis state

    "params": null

Same params as the cosmos hubs except `voting_period` is capped by the unbonding time, and `deposit_period` is a week because that seemed reasonable.
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

Params same as hub 1 & 2 except for unbonding time which is 3 days.
(gaia testnet 13k uses 3 days)

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

Currently all the same as both hub versions and kava testnet 1.1
except `max_evidence_age` which is set to the staking unbonding time

    "slashing": {
        "params": {
            "max_evidence_age": "259200000000000", // 3 days, must be same as unbonding period
            "signed_blocks_window": "10000", // 17.03hrs hours @ 6.13s block time (block time of testnet 1.1)
            "min_signed_per_window": "0.050000000000000000", // can be down for up to 16.18hrs without slashing
            "downtime_jail_duration": "600000000000", // 10min
            "slash_fraction_double_sign": "0.050000000000000000",
            "slash_fraction_downtime": "0.000100000000000000"
        },
        "signing_infos": {},
        "missed_blocks": {}
    },

Automatically added

    "accounts": [...]

New in v0.36
Note: neither `add-genesis-account` or `collect-gentx` modifies the supply. If it's empty here, then it's set when the chain starts based on the accounts.

    "supply": {
        "supply": {
            "total": []
        }
    }