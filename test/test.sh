#!/bin/bash

RED='\033[0;31m'
LGR='\033[1;32m'
YEL='\033[1;33m'
NC='\033[0m'

dir1="output/*/*"
dir2="answers"

if [ ! -d "output" ]
then
    echo "[error] should genreate the output/ dir first"
    exit 1
fi

if diff --help 2>&1 | grep "strip-trailing" > /dev/null 2>&1
then
    DIFF="diff -s --strip-trailing-cr"
else
    DIFF="diff -s"
fi

correct=0
pass=0
ignore=0

echo " ======== testing ========= "

for file in ${dir1};
do
    ans="${dir2}/${file#*/}"

    # check the answers/ exist
    if [ ! -f ${ans} ]
    then
        ((ignore=ignore+1))
        echo -e "${YEL}[-] The answer of ${file} didn't exist${NC}"
        continue
    fi

    ((pass=pass+1))

    # compare the file with answer in answers/
    #if cmp -s "${file}" "${ans}"
    if $DIFF "${file}" "${ans}" > /dev/null
    then
        ((correct=correct+1))
        echo -e "$(printf "%02d" $pass). ${LGR}[O] ${file} pass the test${NC}"
    else
        echo -e "$(printf "%02d" $pass). ${RED}[X] ${file} is incorrect${NC}"
    fi
done


echo " ========================== "

echo " passed the test ${correct}/${pass}, and ${ignore} ignored"
