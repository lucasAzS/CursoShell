#!/usr/bin/env bash

#exercise using read

read -rp "What is the value of a? " A
read -rp "What is the value of b? " B

sum() {
    printf "The sum of the values are %i\n" $((A + B))
}

sum
