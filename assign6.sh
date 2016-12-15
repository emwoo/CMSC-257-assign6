#!/bin/bash

re1="\^."
re2="/[A-Z]\w/g"
re3="\b[d|D]+[a-z|A-Z]*[d|D]+\b"
re4="\b[a|A]+[a-z|A-Z]*\b"
re5="\b[0-9]+\b"
re6="\b[A-Z|a-z]+[0-9]+\b"
re7="\b[0-9]+[A-Z|a-z]+\b"

linecount=0
wordcount=0
mostrepeat=0
leasrepeat=0
ddcount=0
aacount=0
numcount=0
alphanumcount=0

filename=${1}
while read -r line
do
	linecount=$((linecount+1))
	words=${line}   
	for word in $words
	do 
	wordcount=$((wordcount+1))

		if [[ $word =~ $re3 ]]; then
			ddcount=$((ddcount+1))
		fi
	
		if [[ $word =~ $re4 ]]; then
			aacount=$((aacount+1))
		fi
	
		if [[ $word =~ $re5 ]]; then
			numcount=$((numcount+1))
		fi
		
		if [[ $word =~ $re6 ]]; then
			alphanumcount=$((alphanumcount+1))
		fi
		
		if [[ $word =~ $re7 ]]; then
			alphanumcount=$((alphanumcount+1))	
		fi
done
done < ${filename}

echo "Line count: "
echo "      $linecount"
echo "Word count: "
echo "      $wordcount"
echo "Frequency of most repetitive: "
tr -c '[:alnum:]' '[\n*]' < ${filename} | sort | uniq -c | sort -nr | head -1
echo "Frequency of least repetitive: " 
tr -c '[:alnum:]' '[\n*]' < ${filename} | sort | uniq -c | sort -nr | tail -1
echo "d-d word count: "
echo "      $ddcount"
echo "Aa- word count: "
echo "      $aacount"
echo "Numberic count: "
echo "      $numcount"
echo "Alphanumberic count: "
echo "      $alphanumcount"



