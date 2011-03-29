# author:	le.jhe@free.fr
# version:	0.1
# license:	GPL
# usage:	*TBD*
# description:	*TBD*
# requires:	*TBD*
# example:	*TBD*

left=cal-axa
right=cal-std

usage() {
	echo "$0 delete <file-extension>"
	exit 1
}

main() {
	for file in `ls ../$left/$path`
	do
		echo "$file"
		diff ../$left/$path/$file ../$right/$path/$file > ./$path/$file.diff
	done
	exit 0
}

case $# in
0)
	usage
;;
1)
	path=$1
	echo "root-left=$left"
;;
2)
	type=$2
	echo "root-right=$right"
	echo "Extension test : Not Yet Implemented!!"
;;
*)
	usage
;;
esac
# call main
main
