# author:	le.jhe@free.fr
# version:	1.0
# license:	GPL
# usage:	instpatch.sh
# description:	This scripts automates Solaris patches download. It uses a list file to know
#		which patches to get. The syntax for the list file is as follows:
#		"["<patch_num> [, <patch_num>]"]"
#		for example : [113648-03, 116602-01, 111317-05, 111023-03, 115827-01]
# requires:	wget
# example:	tmplt.sh
#WGET_OPTION=--proxy=off 

usage() {
	echo "$0 <patch_file>"
	exit 1
}

outputDir=patches

case $# in
	0)
		usage
	;;
	1)
	list=`cat $1 | sed "s/\[\(.*\)\]/\1/g" | sed "s/,\ /\ /g"`
	echo "list is ${list}"

	if [ ! -d $outputDir ]; then
		mkdir -p ${outputDir}
	fi

	for patchNum in $list
	do
	       	#clear
		echo "----------- $patchNum -------------"
		wget -c -nc $WGET_OPTION -O${outputDir}/${patchNum}.zip "http://sunsolve.sun.com/pub-cgi/patchDownload.pl?target=${patchNum}&method=f"
		echo "-----------/$patchNum -------------"
	done
	;;
	*)
		usage
	;;
esac
