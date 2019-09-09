module kava-labs/kava-testnets/periodic-vesting-accounts

go 1.12

require (
	github.com/cosmos/cosmos-sdk v0.37.0
	github.com/cosmos/gaia v1.0.0 // indirect
	github.com/otiai10/copy v1.0.1
	github.com/spf13/cobra v0.0.5
	github.com/spf13/viper v1.4.0
	github.com/stretchr/testify v1.3.0
	github.com/tendermint/go-amino v0.15.0
	github.com/tendermint/tendermint v0.32.3
	github.com/tendermint/tm-db v0.1.1
)

replace github.com/cosmos/cosmos-sdk => ../../cosmos-sdk
