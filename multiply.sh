#!/bin/bash

a=$1
b=$2

multiply () {
local ans=`expr $a \* $b`
echo "$ans";
return "0"
}

multiply


