#! /bin/bash


function is_div_by_number()
{
	local num="$1"
	local div_by="$2"
	local result=0
	local ret_status=0
	
	if (( $num % $div_by == 0 )); then
		result=true
	else
		result=false
	fi
	echo "$result"
	
	return $ret_status
}


function is_div_by_five()
{
	local num="$1"
	local DIV_BY=5
	local result=$(is_div_by_number "$num" "$DIV_BY")
	local ret_status="$?"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	else
		echo "Error in 'is_div_by_number'."
	fi
	
	return $ret_status
}


function main()
{
	### workaround to handle the pitfall of local declaration changing the return status ($?) - 'is_div_by_five_func_result' must be globaly unique
	is_div_by_five_func_result=$(is_div_by_five "$1")
	local ret_status="$?"
	###
	local result="$is_div_by_five_func_result"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	fi
	
	exit "$ret_status"
}


# in case of running as a script
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "${@}"
fi

