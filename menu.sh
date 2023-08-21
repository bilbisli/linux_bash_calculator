#!/bin/bash

# imports - utilities
source ./utils/is_bi_int_operands.sh
# imports - math operations
for import in ./math_operations/*/*.sh; do
	source $import
done


function menu()
{
	local keep_running_flag=true
	local exit_option="Exit"
	local ret_status=1							# successful return status (0) only when exit option is chosen from menu
	local result=0
	local advanced_result=0
	local operand1=0
	local operand2=0
	
	local operations=("Add" "Subtract" "Multiply" "Divide" "Power of" "Modulos")
	local operations+=("$exit_option")
	local simple_math_scripts=("add" "subtract" "multiply" "divide" "power_of" "modulus")
	local simple_math_scripts+=('exit')
	local advanced_operations=("Is the number a prime number" "Is the number even or odd" "Is the number divisble by 5")
	local advanced_math_scripts=("is_prime" "is_even_odd" "is_div_by_five")
	
	while [[ "$keep_running_flag" == true ]]; do
		# menu presentation
		echo "Choose an item:"
		for (( i=0 ; i < ${#operations[@]} ; i++ )) do
			echo -e "\t$(($i + 1))) ${operations[i]}"
		done
		
		# menu choice
		read -p "Choice: " choice
		if [[ "$choice" == [1-${#simple_math_scripts[@]}] ]]; then
			echo "Option chosen: ${operations[choice - 1]}"
		
			if [[ "${operations[choice - 1]}" == "$exit_option" ]]; then	# exit condition
				keep_running_flag=false
				ret_status=0						# successful return status (0)
			else								# math operations
				# operands input
				read -p "Enter two operands for the ${operations[choice - 1]} opration: " operand1 operand2
				# operands validation
				result=$(is_bi_int_operands "$operand1" "$operand2")
				if [[ "$?" -eq 0 && "$result" == true ]]; then
					# math operation after input validation
					result=$(${simple_math_scripts[choice - 1]} ${operand1} ${operand2})
					if [[ "$?" -eq 0 ]]; then			# math operation success checkup
						echo "The result is: $result"
						# advanced math operations on result
						for (( i=0 ; i < ${#advanced_math_scripts[@]} ; ++i )); do
							advanced_result=$(${advanced_math_scripts[i]} ${result})
							echo "${advanced_operations[i]}? $advanced_result"
						done
					fi
				else
					echo "Error : Invalid input - There must be exactly two integers as operands!" >> /dev/stderr
				fi
			fi
		else
			echo "Error - no such option."  >> /dev/stderr
		fi
		echo -e "\n#################################################\n"
	done
	
	return $ret_status
}


function main()
{
	menu
	local ret_status="$?"

	exit "$ret_status"
}


# in case of running as a script
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "${@}"
fi

