#!/bin/bash
set -euo pipefail

SEARCH_PATTERN=$1
OUTPUT=${2:-results.txt}

if [[ -e $OUTPUT ]]; then
    echo "File $OUTPUT already exists."
    exit 1
fi

curl -o moby-dick.txt https://gist.githubusercontent.com/StevenClontz/4445774/raw/1722a289b665d940495645a5eaaad4da8e3ad4c7/mobydick.txt

OCCURENCES=$(grep -iwo "$1" moby-dick.txt | wc -l)

echo "The search pattern '$1' was found $OCCURENCES time(s)." > $OUTPUT
grep -inw "$1" moby-dick.txt | cut -d: -f2- >> $OUTPUT