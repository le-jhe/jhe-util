# author:	le.jhe@free.fr
# version:	1.0
# license:	GPL
# usage:	tmplt.sh
# description:	This is just a template for creating new shell scripts.
# requires:	Nothing
# example:	tmplt.sh

usage() {
	echo "$0	: This is just a template for creating new shell scripts."
	echo "		  It does nothing."
	exit 1
}

main() {
	usage
	exit 0
}

case $# in
0)
	usage
;;
1)
;;
2)
;;
*)
	usage
;;
esac

# call main
main
