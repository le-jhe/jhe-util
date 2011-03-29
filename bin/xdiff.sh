# author:	le.jhe@freesbee.fr
# version:	1.0
# license:	GPL
# usage:	xdiff.sh <root-path> [<file-extension>]
# description:	This script logs 'diff' on two different directory arborescences, eventually regarding
#		only one type of files.
# requires:	Nothing
# example:	xdiff.sh ../path/to/both/arborescences java

#left=cal-axa
#right=cal-std
left=left
right=right
path=.

usage() {
	echo "$0 <root-path> [<file-extension>]"
	exit 1
}

main() {
	echo "root-left  = $left"
	echo "root-right = $right"
	fName=./xdiff-${type}-`date -I +%Y%M%d%H%M%S`.log
	echo "log-file   = $fName"

	echo "---- New Run."		>> $fName
	echo "---- Checking on:"	>> $fName
	echo "----   $path/$left"	>> $fName
	echo "----   $path/$right"	>> $fName
	echo "---- Type: $type"		>> $fName

	oldPath=`pwd`
	echo "-- oldPath : $oldPath"
	pushd $path/$left		>> /dev/null
	pwd
	if [  "x$type" != "x" ]; then
		for file in `cd $path/$left && find . -type f -name "*.${type}"`
		do
			echo ""						>> $oldPath/$fName
			echo "---- $file -----------------------------"	>> $oldPath/$fName
			diff ../$left/$file ../$right/$file		>> $oldPath/$fName
			echo "8<--------------------------------------"	>> $oldPath/$fName
		done
	else
		for file in `cd $path/$left && find . -type f -name "*"`
		do
			echo ""						>> $oldPath/$fName
			echo "---- $file -----------------------------"	>> $oldPath/$fName
			diff ../$left/$file ../$right/$file		>> $oldPath/$fName
			echo "8<--------------------------------------"	>> $oldPath/$fName
		done
	fi
	popd				>> /dev/null
	vim $fName && rm $fName
	exit 0
}

case $# in
0|1)
	usage
;;
2)
	#path=$1
	left=$1
	right=$2
;;
3)
	left=$1
	right=$2
	type=$2
	echo "Extension test : Not Yet Implemented!!"
;;
*)
	usage
;;
esac
# call main
main
