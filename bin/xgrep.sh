# author:	le.jhe@free.fr
# version:	1.0
# license:	GPL
# usage:	xgrep.sh <pattern> [<file-extension>]
# description:	Do a 'find -type -f -name "*[.<file-extension>]" | grep <pattern>' and logs result
#		in a file with reference to the matching files.
# requires:	Nothing
# example:	xgrep.sh "java.util.Hashtable" java

usage() {
	echo "$0 <pattern> [<file-extension>]"
	exit 1
}

main() {
	fPattern=`echo $pattern |sed "s/\//_/g"`
	fPattern=`echo $pattern |sed "s/\ /_/g"`
	echo "fPattern"
	fName=./xgrep_${fPattern}_${type}
	#echo "file Name: $fName"

	echo "---- New Run." >> $fName
	echo "---- pattern: $pattern" >> $fName
	echo "---- type   : $type" >> $fName
	echo "---- options: $options" >> $fName

	if [  "x$type" != "x" ]; then
		for file in `find . -type f -name "*.${type}"`
		do
			echo $file >> $fName
			grep $options "$pattern" "$file" >> $fName
		done
	else
		for file in `find . -type f -name "*"`
		do
			echo $file >> $fName
			grep $options "$pattern" "$file" >> $fName
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
;;
2)
	pattern=$1
	echo "pattern=$pattern"
	type=$2
	echo "type=$type"
	#echo "Extension test : Not Yet Implemented!!"
;;
3)
	echo "Options are experimental: Not Yet Implemented!!"
	options=$1
	pattern=$2
	echo "pattern=$pattern"
	type=$3
	echo "type=$type"
;;
*)
	usage
;;
esac
# call main
main
