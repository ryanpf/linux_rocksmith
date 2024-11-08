#!/bin/bash

#ldpreload-command missing

trap "exit" INT

# $1: $dist
# $2: $filename

case $1 in
	arch|deck)
		echo "path script: arch"
		sed -i 's/000-lib64unix-000/\/usr\/lib\/wine\/x86_64-unix/' $2
		#echo p1
		sed -i "s/000-lib64windows-000/\/usr\/lib\/wine\/x86_64-windows/" $2
		#echo p2
		sed -i "s/000-lib32unix-000/\/usr\/lib32\/wine\/i386-unix/" $2
		#echo p3
		sed -i "s/000-lib32windows-000/\/usr\/lib32\/wine\/i386-windows/" $2
		sed -i "s/000-lib32-000/lib32/" $2
		sed -i "s/000-lib64-000/lib/" $2
		sed -i "s/000-libjack-path-000/\/usr\/lib32/" $2
		;;
	deb)
		echo "path script: debian"
		sed -i 's/000-lib64unix-000/\/usr\/lib\/x86_64-linux-gnu\/wine/' $2
		#echo p1
		sed -i "s/000-lib64windows-000/\/usr\/lib\/x86_64-linux-gnu\/wine/" $2
		#echo p2
		sed -i "s/000-lib32unix-000/\/usr\/lib\/i386-linux-gnu\/wine/" $2
		#echo p3
		sed -i "s/000-lib32windows-000/\/usr\/lib\/i386-linux-gnu\/wine/" $2
		sed -i "s/000-lib32-000/lib/" $2
		sed -i "s/000-lib64-000/lib64/" $2
		sed -i "s/000-libjack-path-000/\/usr\/lib\/i386-linux-gnu\/pipewire-0.3\/jack/" $2
	;;
	fed)
		echo "path script: fedora"
		sed -i 's/000-lib64unix-000/\/usr\/lib64\/wine\/x86_64-unix/' $2
		#echo p1
		sed -i "s/000-lib64windows-000/\/usr\/lib64\/wine\/x86_64-windows/" $2
		#echo p2
		sed -i "s/000-lib32unix-000/\/usr\/lib\/wine\/i386-unix/" $2
		#echo p3
		sed -i "s/000-lib32windows-000/\/usr\/lib\/wine\/i386-windows/" $2
		sed -i "s/000-lib32-000/lib/" $2
		sed -i "s/000-lib64-000/lib64/" $2
		sed -i "s/000-libjack-path-000/\/usr\/lib\/pipewire-0.3\/jack/" $2
		;;
	*)
		echo "error: could not find out."
		exit 2
		;;
esac

exit 0
