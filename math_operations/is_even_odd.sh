#!/bin/bash

ans=$1


is_even_odd() {

	if (( "$1" % 2 ));then
		echo "The number is odd"
	else 
		echo "The number is even"
	fi
return 0	
}

function main(){
		ansFromAns=$1
#		echo "$ansFromAns"
	if [[ $ansFromAns =~ ^[0-9]*\.[0-9]+$ ]]; then
		 intger_after_float="${ansFromAns%%.*}"
		 echo "$intger_after_float"
		 echo "$(is_even_odd $intger_after_float)"
	fi
}

main $ans



