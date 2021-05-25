#!/bin/bash

function ipv4mask_to_num {
  local ipv4mask=$1
  local arr=(${ipv4mask//./ })
  local num=0
  for n in ${arr[@]}; do
    local bin=$(echo "obase=2;$n" | bc)
    local cnt1=$(echo -n $bin | sed -e 's/0//g' | wc -c)
    (( num += cnt1 ))
  done
  echo -n $num
}
