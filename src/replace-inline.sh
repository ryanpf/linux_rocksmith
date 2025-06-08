#!/bin/bash

# ldpreload-command missing

trap "exit" INT

# $1: $dist
# $2: sound
# $3: $filename

case $1 in
	arch|deck)
		echo "replace inline: arch"
		sed -i 's/000-lib64unix-000/\/usr\/lib\/wine\/x86_64-unix/' $3
		#echo p1
		sed -i "s/000-lib64windows-000/\/usr\/lib\/wine\/x86_64-windows/" $3
		#echo p2
		sed -i "s/000-lib32unix-000/\/usr\/lib\/wine\/i386-unix/" $3
		#echo p3
		sed -i "s/000-lib32windows-000/\/usr\/lib\/wine\/i386-windows/" $3
		sed -i "s/000-lib32-000/lib32/" $3
		sed -i "s/000-lib64-000/lib/" $3
		sed -i "s/000-libjack-path-000/\/usr\/lib32/" $3
		sed -i "s/000-list-inst-000/pacman -Q/" $3
		sed -i "s/000-wineasio-register-000/.\/wineasio-register/" $3
		;;
	deb)
		echo "replace inline: debian"
		sed -i 's/000-lib64unix-000/\/usr\/lib\/x86_64-linux-gnu\/wine/' $3
		#echo p1
		sed -i "s/000-lib64windows-000/\/usr\/lib\/x86_64-linux-gnu\/wine/" $3
		#echo p2
		sed -i "s/000-lib32unix-000/\/usr\/lib\/i386-linux-gnu\/wine/" $3
		#echo p3
		sed -i "s/000-lib32windows-000/\/usr\/lib\/i386-linux-gnu\/wine/" $3
		sed -i "s/000-lib32-000/lib/" $3
		sed -i "s/000-lib64-000/lib64/" $3
		sed -i "s/000-libjack-path-000/\/usr\/lib\/i386-linux-gnu\/pipewire-0.3\/jack/" $3
		sed -i "s/000-list-inst-000/apt list --installed/" $3
		sed -i "s/000-wineasio-register-000/wineasio-register/" $3
	;;
	fed)
		echo "replace inline: fedora"
		sed -i 's/000-lib64unix-000/\/usr\/lib64\/wine\/x86_64-unix/' $3
		#echo p1
		sed -i "s/000-lib64windows-000/\/usr\/lib64\/wine\/x86_64-windows/" $3
		#echo p2
		sed -i "s/000-lib32unix-000/\/usr\/lib64\/wine\/i386-unix/" $3
		#echo p3
		sed -i "s/000-lib32windows-000/\/usr\/lib64\/wine\/i386-windows/" $3
		sed -i "s/000-lib32-000/lib/" $3
		sed -i "s/000-lib64-000/lib64/" $3
		if [ "$2" = "pipewire" ]; then
			sed -i "s/000-libjack-path-000/\/usr\/lib\/pipewire-0.3\/jack/" $3
		else
			sed -i "s/000-libjack-path-000/\/usr\/lib/" $3
		fi
		sed -i "s/000-list-inst-000/dnf list installed/" $3
		sed -i "s/000-wineasio-register-000/.\/wineasio-register/" $3
		;;
	*)
		echo "error: could not find out dist"
		exit 2
		;;
esac

case $2 in
	native)
		echo "replace inline: native"
		sed -i "s/000-start-via-script-000/path\/to\/rocksmith-launcher.sh/" $3
	;;
	pipewire)
		echo "replace inline: pipewire"
		sed -i "s/000-start-via-script-000/PIPEWIRE_LATENCY=\"256\/48000\" path\/to\/rocksmith-launcher.sh/" $3
	;;
	*)
		echo "error: could not find sound"
		exit 2
		;;
esac

exit 0
