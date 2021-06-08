#!/bin/bash
# https://github.com/Hyy2001X/AutoBuild-Actions
# AutoBuild Module by Hyy2001

rm -f /tmp/Cloud_Version
if [ ! -f /bin/AutoUpdate.sh ];then
	echo "获取失败" > /tmp/Cloud_Version
	exit
fi
bash /bin/AutoUpdate.sh -U
exit 0