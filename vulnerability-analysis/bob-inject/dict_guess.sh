#!/bin/bash 
#
# Website paths checker
#
# (c) spinfoo

WEB=https://www.example.com
CEWL=../CeWL/

cd $CEWL

for i in $(./cewl.rb $WEB)
do
	(curl -A "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0" -I $WEB/$i 2> /dev/null) | head -1 | grep -v 404
	if [ $? == 0 ] ; then
		echo -e "\t --> $WEB/$i"
	fi
done
