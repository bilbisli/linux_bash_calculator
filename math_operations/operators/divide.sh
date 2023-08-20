#! /bin/bash


function divide_base()
{
	local a="$1"
	local b="$2"
	local res=0
	local ret_status=0
	
	if [[ "$b" -eq 0 ]]; then
		ret_status=1
	else
		(( res = $a / $b ))
		echo "$res"
	fi
	
	return $ret_status
}

function divide()
{
	### workaround to handle the pitfall of local declaration changing the return status ($?) - 'divide_base_func_result' must be globaly unique
	divide_base_func_result=$(divide_base "$1" "$2")	
	local ret_status="$?"
	###
	local result="$divide_base_func_result"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	else
		echo "Error : cannot use the divide operation with 0 as the second operand." >> /dev/stderr
	fi

	return $ret_status
}


function main()
{
	### workaround to handle the pitfall of local declaration changing the return status ($?) - 'divide_func_result' must be globaly unique
	divide_func_result=$(divide "$1" "$2")
	local ret_status="$?"
	###
	local result="$divide_func_result"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	fi
	
	exit "$ret_status"
}


# in case of running as a script
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "${@}"
fi

