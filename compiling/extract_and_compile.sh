#!/bin/env bash
#Script that extracts content of tar archive and compiles into the current directory. Then it compiles the C program 
#that was extracted generating executable called NthPrime that we can call in our function. 

#Extract NthPrime.tgz file and create NthPrime directory
tar -xf NthPrime.tgz --one-top-level
cd  NthPrime

#Compile the files in NthPrime Directory
gcc -c main.c nth_prime.c
gcc main.o nth_prime.o -o NthPrime

function extract_and_compile() {
./NthPrime $1
}
extract_and_compile $1
