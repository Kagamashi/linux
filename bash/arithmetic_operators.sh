#!/bin/bash

# Basic arithmetic operations using +, -, *, /, %
num1=10
num2=3

sum=$((num1 + num2))
difference=$((num1 - num2))
product=$((num1 * num2))
division=$((num1 / num2))
remainder=$((num1 % num2))

echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Division: $division"
echo "Remainder: $remainder"

# Using let for arithmetic operations
let sum=num1+num2
let difference=num1-num2
let product=num1*num2
let division=num1/num2
let remainder=num1%num2

echo "Sum using let: $sum"
echo "Difference using let: $difference"
echo "Product using let: $product"
echo "Division using let: $division"
echo "Remainder using let: $remainder"

# Using (( )) for arithmetic operations
(( sum = num1 + num2 ))
(( difference = num1 - num2 ))
(( product = num1 * num2 ))
(( division = num1 / num2 ))
(( remainder = num1 % num2 ))

echo "Sum using (( )): $sum"
echo "Difference using (( )): $difference"
echo "Product using (( )): $product"
echo "Division using (( )): $division"
echo "Remainder using (( )): $remainder"

# Using expr for arithmetic operations
sum=$(expr $num1 + $num2)
difference=$(expr $num1 - $num2)
product=$(expr $num1 \* $num2)  # Need to escape the * symbol with \ when using expr
division=$(expr $num1 / $num2)
remainder=$(expr $num1 % $num2)

echo "Sum using expr: $sum"
echo "Difference using expr: $difference"
echo "Product using expr: $product"
echo "Division using expr: $division"
echo "Remainder using expr: $remainder"
