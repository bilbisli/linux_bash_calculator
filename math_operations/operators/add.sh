#! /bin/bash


function add()
{
	local a="$1"
	local b="$2"
	local answer=$(( a+b ))
	local ret_status=0
	
	echo "$answer"
	
	return $ret_status
}


function main()
{
	### workaround to handle the pitfall of local declaration changing the return status ($?) - 'add_func_result' must be globaly unique
	add_func_result=$(add "$1" "$2")
	local ret_status="$?"
	###
	local result="$add_func_result"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	fi
	
	exit "$ret_status"
}


# in case of running as a script
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "${@}"
fi

