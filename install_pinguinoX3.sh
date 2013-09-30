#!/bin/sh
# Script to install Pinguino IDE X revision 399 in GNU/Linux.
# Raul Zanardo : zanardo19@hotmail.com
# Krister Perssson : krister.cacti@gmail.com 
# David Carmona (Update): dacarmo@ono.com
# Arthur Wallendorff (Update/Edit): flaco@core-unit.net

echo ------------------- "Downloading Pinguino X IDE"

wget http://pinguino32.googlecode.com/files/pinguinoX.3rev399.tar.lzma

echo ------------------- "Unpacking Files and remove the .tar file"

tar --lzma -xvf pinguino*.tar.lzma
rm pinguino*.tar.lzma
mv -f pinguinoX.3rev* pinguinoX.3

echo ------------------- "Downloading edited install script"

wget https://raw.github.com/FlacoDev/pinguinoX.3rev399-install-edited/master/pinguino_start.sh
mv pinguino_start.sh pinguinoX.3

echo ------------------- "Checking for, and installing needed Packages."
echo ------------------- "This will take some time, please wait !"

sudo apt-get update > /dev/null
sudo apt-get install libusb-1.0-0 python-wxgtk2.8 python-usb python-svn

echo ------------------- "Creating Permissions"

cd pinguinoX.3

sudo cp extra/rules/41-microchip.rules /etc/udev/rules.d/
sudo cp extra/rules/26-microchip.rules /etc/udev/rules.d/

chmod a+x *.py
chmod a+x pinguino_start.sh
sudo groupadd microchip
sudo usermod -a -G microchip $USER
cd

echo ------------------- "Pinguino IDE installed!"


