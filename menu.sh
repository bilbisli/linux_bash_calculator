#!/bin/bash
multiply() {
local ans=`expr $1 \* $2`
echo "$ans";
}

operations=("Add" "Subtract" "Multiply" "Divide" "Power of" "Modulos" "Exit")
scripts=("add" "subtract" "multiply" "divide" "power_of" "modulus")


echo "Choose an operation to perform:"
select operation in ${operations[@]}; do
	case "$operation" in
	"Add")		echo "Burger = 5\$"	;;
	"Hotdogs")	echo "Hotdogs = 3\$"	;;
	"Icecream")	echo "Icecream = 1.5\$"	;;
	"Falafel")	echo "Falafel = 9\$"	;;
	*)		echo "Wrong choice."	;;
	esac
	break
done

echo "
a. Add
b. Subtract
c. Multiply
d. Divide
e. Power of
f. Modulos
g. Exit
"
read menu

case $menu in

  a)
    add $1 $2
    ;;

  b)
    subtract $1 $2
    ;;
  c)
    multiply $1 $2
    ;;

  d)
    divide $1 $2
    ;;
  e)
    power_of $1 $2
    ;;

  f)
    modulus $1 $2
    ;;
  g)
    exit 
esac





