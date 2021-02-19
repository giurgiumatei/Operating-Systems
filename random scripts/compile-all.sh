#!/bin/bash

for F in *; do
    if file $F | grep -q "C source"; then
        X=`echo $F | sed "s/\..*//"`
        gcc -Wall -g -o $X $F && ./$X
    fi
done
