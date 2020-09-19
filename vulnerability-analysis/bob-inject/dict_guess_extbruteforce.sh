#!/bin/bash 
#
# Brute force website paths checker
#
# (c) spinfoo

WEB=https://www.example.com
CEWL=../CeWL/

cd $CEWL

# for i in $(./cewl.rb $WEB)
for i in $(cat /tmp/dict.txt)
do
	for j in "" .zip .sql .gz .sql.gz .sql.zip .txt .docx
	do
		(curl -A "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0" -I $WEB/$i$j 2> /dev/null) | head -1 | grep -v 404
		if [ $? == 0 ] ; then
			echo -e "\t --> $WEB/$i$j"
		fi
	done
done
