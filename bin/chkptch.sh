# author:	le.jhe@free.fr
# version:	1.0
# license:	GPL
# usage:	chpkptch.sh <patch_num>
# description:	Checks if the patch <patch_num> is installed on a Solaris machine.
# requires:	wget
# example:	./chpkptch.sh 108993-31

usage() {
	echo "$0 <patch_num>"
	exit 1
}

case $# in
	0)
		usage
	;;
	1)
		patchNum=$1
	       	clear
		echo "----------- $patchNum -------------"
	       	showrev -p | grep  $patchNum
		echo "-----------/$patchNum -------------"
	;;
	*)
		usage
	;;
esac
