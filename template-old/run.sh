#!/bin/bash

size=$1

if [ -z "$size" ] #if size not specified
then
    size=128 #default size
fi

/home/root/powercycle.sh
./tracking tracking.out $size car.avi

