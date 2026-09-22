#!/bin/bash
set -euo pipefail
wget https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz 
tar -xzvf lab3-bundle.tar.gz
cat lab3_data.tsv | tr -s '\n' > cleaned.tsv
cat cleaned.tsv | tr '\t' ',' > cleaned.csv
LINE_COUNT=$(tail -n +3 cleaned.csv | wc -l)
echo $LINE_COUNT
tar -czvf converted-archive.tar.gz cleaned.csv
