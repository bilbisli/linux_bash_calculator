#! /bin/bash


function is_bi_int_operands()
{
	local a="$1"
	shift
	local b=${@}
	local result=true
	local ret_status=0
	local int_re="^[+-]?([1-9][0-9]*|0)$"
	
	if [[ ! "${b[@]}" =~ $int_re || ! "${a[@]}" =~ $int_re ]]; then
		result=false
	fi
	
	echo "$result"
	
	return $ret_status
}


function main()
{
	### workaround to handle the pitfall of local declaration changing the return status ($?) - 'is_bi_int_operands_func_result' must be globaly unique
	is_bi_int_operands_func_result=$(is_bi_int_operands "${@}")
	local ret_status="$?"
	###
	local result="$is_bi_int_operands_func_result"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	fi
	
	exit "$ret_status"
}


# in case of running as a script
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main "${@}"
fi

