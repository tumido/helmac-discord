#!/bin/sh


resource="${1%%.*}"
name="${1##*.}"
echo "resource \"$resource\" \"$name\" {}" >> $3

terraform import $1 $2

if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_INPLACE=(-i '')
else
  SED_INPLACE=(-i)
fi
sed "${SED_INPLACE[@]}" '$d'  $3

terraform state show $1 >>  $3
