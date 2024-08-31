#!/usr/bin/env bash

echo ""
echo "
░░░░░░░░░░░░░░░░░░▄░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░▌▄▄▄▀█▄░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░█░░░░██░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░█▄▄█▀▀░░░░░░░░░░░░░░░░
░░░░░░░░░░░░▄▄░░░░▌░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░██▀░░▀▀█▐░░░░▄▄▄░░░░░░░░░░░░░░░
░░░░░░░█░░░░░░░░░█▌░█░░░░▀█░░░░░░░░░░░░░
░░░░░░░▌░░░░░░░░░▐█▀░░░░░░░░█░░░░░░░░░░░
░░░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░▌░░░░░░░░░░░░░░░░░░░░░░▌░░░░░░░░░░
░░░░░░▌░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░
░░░░░░▌░░░░░░░░░░░░░░░░░░░░░░▐░░░░░░░░░░
░░░░░░▌░░░░░░░░░░░░░░░░░░░░░░▐░░░░░░░░░░
░░░░░░▌░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░
░░░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░▐░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░░
░░░░░░░█▄░░░░░░░░░░░░░░░░░░░▌░░░░░░░░░░░
░░░░░░░░░▀▄▄░░░░░░▀█░░░░░░░█░░░░░░░░░░░░
░░░░░░░░░░░░▀▀▄▄▄▄▌▐▄▄▄▄▄█░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
"
echo ""

echo 'THIS MAY TAKE SOME TIME TO INSTALL. JUST WAIT...'
sleep 2

# Function to check and ask for --break-system-packages
function check_break_system_packages() {
    if [ ! -f "/tmp/use_break_system_packages" ]; then
        echo "Some Python packages may require --break-system-packages to install. Do you want to allow this? (y/n)"
        read -r allow_break
        if [ "$allow_break" = "y" ]; then
            touch /tmp/use_break_system_packages
            PIP_INSTALL="pip install --break-system-packages"
        else
            echo "Exiting script as --break-system-packages is not allowed."
            exit 1
        fi
    else
        PIP_INSTALL="pip install --break-system-packages"
    fi
}

echo "Installing the Requirements..."
echo ''
echo ""
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y libtool
echo ""
echo "Please Wait!"
sudo apt update -y
sleep 1
sudo add-apt-repository universe -y
sudo apt-get update -y
sudo apt install -y libimobiledevice-utils libusbmuxd-tools git curl python3 python3-pip
wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb
sudo apt-get update -y

echo ""
echo "Installing tk For GUI and python..."
sudo apt install -y python3-tk irecovery

# Check and ask for --break-system-packages
check_break_system_packages

$PIP_INSTALL libimobiledevice
$PIP_INSTALL tk
$PIP_INSTALL Pillow

echo ""
echo ""
echo "Installing tk for GUI..."
$PIP_INSTALL tk
sudo apt install -y sshpass
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pillow
sudo apt update -y
echo ""
echo "Installing ImagTk For GUI"
sudo apt-get install -y python3-pil.imagetk 
echo ""
sudo apt update -y
echo ""
echo ""
sudo apt upgrade -y
echo "Done!"
echo ""
echo "FINISHED INSTALLING REQUIREMENTS!!!"
echo ""
echo "DONE!!"
echo ""
exit 1
