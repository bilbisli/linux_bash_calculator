#!/bin/bash
multiply() {
local ans=`expr $1 \* $2`
echo "$ans";
}

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





