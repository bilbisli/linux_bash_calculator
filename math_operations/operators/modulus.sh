#! /bin/bash


function modulus_base()
{
	local a="$1"
	local b="$2"
	local res=0
	local ret_status=0
	
	if [[ "$b" -eq 0 ]]; then
		ret_status=1
	else
		(( res = $a % $b ))
		echo "$res"
	fi
	return $ret_status
}

function modulus()
{
	### workaround to handle the pitfall of local declaration changing the return status ($?) - 'modulus_base_func_result' must be globaly unique
	modulus_base_func_result=$(modulus_base "$1" "$2")	
	local ret_status="$?"
	###
	local result="$modulus_base_func_result"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	else
		echo "Error : cannot use the modulus operation with 0 as the second operand." >> /dev/stderr
	fi
	
	return $ret_status
}


function main()
{
	### workaround to handle the pitfall of local declaration changing the return status ($?) - 'modulus_func_result' must be globaly unique
	modulus_func_result=$(modulus "$1" "$2")
	local ret_status="$?"
	###
	local result="$modulus_func_result"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	fi
	
	exit "$ret_status"
}


# in case of running as a script
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "${@}"
fi

