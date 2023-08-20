#! /bin/bash


function is_prime()
{
	local num=$1
	local i=2
	local result=true
	local ret_status=0

	if [[ $num -lt 2 ]]; then
	    result=false
	else
	    while [[ "$i" -lt "$num" ]]; do
		if (( $num % $i == 0 )); then
	    		result=false
			break
		fi
		(( i=$i + 1 ))
	done
	fi

	echo "$result"

	return $ret_status   
}


function main()
{
	### workaround to handle the pitfall of local declaration changing the return status (#?) - 'is_prime_func_result' must be globaly unique
	is_prime_func_result=$(is_prime "$1" "$2")
	local ret_status="$?"
	###
	local result="$is_prime_func_result"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	fi
	
	exit "$ret_status"
}


# in case of running as a script
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "${@}"
fi

