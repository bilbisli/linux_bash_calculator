#! /bin/bash


function print_paths_to_scripts()
{
	local MATH_DIR='./math_operations/'
	local SIMPLE_MATH_SUBDIR='operators/'
	local ADVANCED_MATH_SUBDIR='advanced/'
	#local operations=("Add" "Subtract" "Multiply" "Divide" "Power of" "Modulos")
	local operations=("Divide" "Add")
	#local simple_math_scripts=("add" "subtract" "multiply" "divide" "power_of" "modulus")
	local simple_math_scripts=("add" "divide")
	#local advanced_operations=("Is the number a prime number" "Is the number even or odd" "Is the number divisble by 5")
	#local advanced_math_scripts=("is_prime" "is_even_odd" "is_div_by_five")
	
	# basic math operations
	ls "${MATH_DIR}${SIMPLE_MATH_SUBDIR}" 
	
	# advanced math operations
	ls "${MATH_DIR}${ADVANCED_MATH_SUBDIR}"
}

main()
{
	print_paths_to_scripts
}


main
