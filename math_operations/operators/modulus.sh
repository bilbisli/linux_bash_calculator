#! /bin/bash

function modulus()
{
	a="$1"
	b="$2"
	res=0
	ret_status=0
	
	if [[ "$b" -eq 0 ]]; then
		ret_status=1
	else
		(( res = $a % $b ))
		echo "$res"
	fi
	return $ret_status
}

function main()
{
	result="$(modulus $1 $2)"
	ret_status=$?
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	else
		echo "Error : cannot use the modulus operation with 0 as the second operand."
	fi
	
	return $ret_status
}

main "$1" "$2"