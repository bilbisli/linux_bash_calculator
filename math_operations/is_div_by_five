#! /bin/bash

function is_div_by_number()
{
	num="$1"
	div_by="$2"
	result=0
	ret_status=0
	
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
	num="$1"
	DIV_BY=5
	result=$(is_div_by_number "$num" "$DIV_BY")
	ret_status="$?"
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	else
		echo "Error in 'is_div_by_number'."
	fi
	
	return $ret_status
}

function main()
{
	result="$(is_div_by_five $1)"
	ret_status=$?
	
	if [[ "$ret_status" -eq 0 ]]; then
		echo "$result"
	else
		echo "Error in 'is_div_by_five'."
	fi
	
	return $ret_status
}

main "$1"
