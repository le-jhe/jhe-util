# author:	le.jhe@free.fr
# version:	1.0
# license:	GPL
# usage:	xjar.sh <pattern> <type>
# 		type will usually be "jar"
# description:	find under the currect directory all file matchine *.<type>
#		lists all files content (jar tvf), and grep for <pattern> on the output
#		the result is store in a file named xjar.<timestamp>.log
# example:	xjar.sh javax/xml/parsers/SAXParser jar

usage() {
	echo "$0 <pattern> [<file-extension>]"
	exit 1
}

main() {
	#fName=./xgrep_${pattern}_${type}
	fName=./xgrep.`date -I +%Y%M%d%H%M%S`.log
	echo "log file Name: $fName"

	echo "---- New Run." >> $fName
	echo "---- pattern: $pattern" >> $fName
	echo "---- type   : $type" >> $fName

	if [  "x$type" != "x" ]; then
		for file in `find . -type f -name "*.${type}"`
		do
			echo $file >> $fName
			jar tvf $file |grep $pattern >> $fName
		done
	else
		for file in `find . -type f -name "*"`
		do
			echo $file >> $fName
			jar tvf $file |grep $pattern >> $fName
		done
	fi 

	cat $fName

	exit 0
}

case $# in
0)
	usage
;;
1)
	pattern=$1
	echo "pattern=$pattern"
	type="jar"
	echo "type=$type"
;;
2)
	pattern=$1
	echo "pattern=$pattern"
	type=$2
	echo "type=$type"
	#echo "Extension test : Not Yet Implemented!!"
;;
*)
	usage
;;
esac

# call main
main
