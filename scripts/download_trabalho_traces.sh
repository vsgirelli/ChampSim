#!/bin/bash

mkdir -p $PWD/../trabalho_traces
while read LINE
do
    wget -P $PWD/../trabalho_traces -c http://hpca23.cse.tamu.edu/champsim-traces/speccpu/$LINE
done < trabalho_max_simpoint.txt
