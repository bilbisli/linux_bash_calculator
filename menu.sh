#!/bin/bash

# imports - math operations
for import in ./math_operations/*/*.sh; do
	. $import
done


function menu()
{
	local keep_running_flag=true
	local exit_option="Exit"
	local ret_status=0
	local result=0
	local advanced_result=0
	
	local operations=("Add" "Subtract" "Multiply" "Divide" "Power of" "Modulos")
	local operations+=("$exit_option")
	local simple_math_scripts=("add" "subtract" "multiply" "divide" "power_of" "modulus")
	local simple_math_scripts+=('exit')
	local advanced_operations=("Is the number a prime number" "Is the number even or odd" "Is the number divisble by 5")
	local advanced_math_scripts=("is_prime" "is_even_odd" "is_div_by_five")
	
	while [[ "$keep_running_flag" == true ]]; do
		echo "Choose an item:"
		for (( i=0 ; i < ${#operations[@]} ; i++ )) do
			echo -e "\t$(($i + 1))) ${operations[i]}"
		done

		read -p "Choice: " choice
		if [[ $choice == [1-${#simple_math_scripts[@]}] ]]; then
			echo "Option chosen: ${operations[choice - 1]}"
		else
			echo "Error - no such option."
		fi
		if [[ "${operations[choice - 1]}" == "$exit_option" ]]; then
			keep_running_flag=false
		else
			read -p "Enter two operands for the ${operations[choice - 1]} opration: " operand1 operand2
			# TODO: add validation of input
			#result=${MATH_DIR}${SIMPLE_MATH_SUBDIR}${simple_math_scripts[choice - 1]} ${operand1} ${operand2}`
			
			result=$(${simple_math_scripts[choice - 1]} ${operand1} ${operand2})
			if [[ "$?" -eq 0 ]]; then
				echo "The result is: $result"
				for (( i=0 ; i < ${#advanced_math_scripts[@]} ; ++i )); do
					#advanced_result=`${MATH_DIR}${ADVANCED_MATH_SUBDIR}${advanced_math_scripts[i]} ${result}`
					advanced_result=$(${advanced_math_scripts[i]} ${result})
					echo "${advanced_operations[i]}? $advanced_result"
				done
			fi
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

