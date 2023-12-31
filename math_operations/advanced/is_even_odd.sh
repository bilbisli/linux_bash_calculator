#!/bin/bash


function is_even_odd_base()
{
	local ret_status=0
	
	if (( "$1" % 2 ));then
		echo "odd"
	else 
		echo "even"
	fi
	
	return $ret_status	
}

function is_even_odd()
{
	local a=$1
	local result=0
	local ret_status=0
	
	if [[ $ansFromAns =~ ^[0-9]*\.[0-9]+$ ]]; then
		 a="${a%%.*}"
	fi
	result=$(is_even_odd_base $a)
	ret_status="$?"
	
	echo "$result"
	
	return $ret_status
}


function main()
{
	### workaround to handle the pitfall of local declaration changing the return status (#?) - 'is_even_odd_func_result' must be globaly unique
	is_even_odd_func_result=$(is_even_odd "$1" "$2")
	local ret_status="$?"
	###
	local result="$is_even_odd_func_result"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	fi
	
	exit "$ret_status"
}


# in case of running as a script
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "${@}"
fi

