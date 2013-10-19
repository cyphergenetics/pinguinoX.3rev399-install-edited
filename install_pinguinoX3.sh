#!/bin/bash
# Script to install Pinguino IDE X revision 399 in GNU/Linux.
# Raul Zanardo : zanardo19@hotmail.com
# Krister Perssson : krister.cacti@gmail.com 
# David Carmona (Update): dacarmo@ono.com
# Arthur Wallendorff (Update/Edit): flaco@core-unit.net
# Code cleaned by phr34kz

control_c()
{
 echo -en "\n*** CTRL+C Pressed .. Exiting ***\n" &
 sleep 3
 exit $?
}

trap control_c SIGINT

download1()
{
	wget --tries=0 --timeout=99999 --retry-connrefused --continue http://pinguino32.googlecode.com/files/pinguinoX.3rev399.tar.lzma
}

unpack1()
{
	tar --lzma -xvf pinguino*.tar.lzma
	rm -rf pinguino*.tar.lzma
	mv -f pinguinoX.3rev* pinguinoX.3
}

download_edit()
{
	wget --tries=0 --timeout=99999 --retry-connrefused --continue https://raw.github.com/FlacoDev/pinguinoX.3rev399-install-edited/master/pinguino_start.sh
	mv pinguino_start.sh pinguinoX.3
}

install_dependencies()
{
	sudo apt-get update &&
	sudo apt-get install libusb-1.0-0 python-wxgtk2.8 python-usb python-svn >/dev/null 2>&1
}

create_perm()
{
	cd pinguinoX.3
	sudo cp extra/rules/41-microchip.rules /etc/udev/rules.d/
	sudo cp extra/rules/26-microchip.rules /etc/udev/rules.d/
	chmod a+x *.py
	chmod a+x pinguino_start.sh
	sudo groupadd microchip
	sudo usermod -a -G microchip $USER
	cd
}

clear
echo -en "\n-------------------\n\e[00;31mDownloading Pinguino X IDE\e[00m\n-------------------\n\n\n"
download1
echo -en "\n-------------------\n\e[00;31mUnpacking Files and remove the .tar file\e[00m\n-------------------\n\n\n"
unpack1
echo -en "\n-------------------\n\e[00;31mDownloading edited install script\e[00m\n-------------------\n\n\n"
download_edit
echo -en "\n-------------------\n\e[00;31mChecking for, and installing needed Packages.\nThis will take some time, please wait!\e[00m\n-------------------\n\n\n"
install_dependencies
echo -en "\n-------------------\n\e[00;31mCreating Permissions\e[00m\n-------------------\n\n\n"
create_perm
echo -en "\n-------------------\n\e[00;31mPinguino IDE installed!\e[00m\n-------------------\n\n\n"
sleep 10
exit 0
