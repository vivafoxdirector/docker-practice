#!/bin/bash

# MySQL START
# `service mysql start`

# CREATE OUTPUT DIR
if [ ! -d "output" ]
then
    `mkdir output`
fi

echo "Hello World" > "./output/result.txt"