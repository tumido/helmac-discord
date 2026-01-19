#!/bin/sh


resource="${1%%.*}"
name="${1##*.}"
echo "resource \"$resource\" \"$name\" {}" >> main.tf

terraform import $1 $2

terraform state show $1
