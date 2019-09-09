#! /bin/bash

for i in ~/Kava-Labs/kava-testnets/2002/*.json; do
  echo $i
  kvd add-genesis-account $(jq -r '.value.msg[0].value.delegator_address' $i) $(jq -r '.value.msg[0].value.value.amount' $i)$(jq -r '.value.msg[0].value.value.denom' $i)
done