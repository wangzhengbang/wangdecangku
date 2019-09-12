#!/bin/bash
ts=`date +%s`
minute=`date +%M`
url="http://127.0.0.1:1988/v1/push"
hostname=`hostname`
for line in {sda,sdb,sdc,sdd,sde,sdf,sdg,sdh,sdi,sdj,sdk,sdl,sdm,sdn,sdo,sdp,sdq,sdr,sds,sdt,sdu,sdv,sdw,sdx,sdy,sdz}
do
	d=$(df -h | grep /dev/$line | awk -F ' ' '{print $6}')
	if [ -z "$d" ];
	then
	echo "没有$line盘"
	else
	cd $d
	c=$(touch tmp.txt)
	if [ -z "$c" ];then
		value=1
	else
		value=2
	fi
	data="[{ \
        	\"endpoint\": \"$hostname\", \
        	\"metric\": \"type-baddisk\", \
        	\"timestamp\": "$ts", \
        	\"step\": 60, \
        	\"value\": "$value", \
        	\"counterType\": \"GAUGE\", \
       		\"tags\": \"device=$line\" \
      		}]"
	curl -X POST -d "$data" $url	
	fi
done
