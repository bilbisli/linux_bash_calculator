#! /bin/bash


function power_of()
{
	local a="$1"
	local b="$2"
	local res=0
	local ret_status=0
	
	if [[ "$b" -eq 0 || "$a" -eq 1 ]]; then
		echo "1"
	elif [[ "$b" -lt 0 ]]; then
		echo "0"
	else
		(( res = $a ** $b ))
		echo "$res"
	fi
	
	return $ret_status
}


function main()
{
	### workaround to handle the pitfall of local declaration changing the return status ($?) - 'power_of_func_result' must be globaly unique
	power_of_func_result=$(power_of "$1" "$2")
	local ret_status="$?"
	###
	local result="$power_of_func_result"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	fi
	
	exit "$ret_status"
}


# in case of running as a script
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "${@}"
fi

