#!/usr/bin/env bash
# Set up a Raspberry Pi 2B as wifi access point (AP).
# The AP will obtain an IP address via DHCP through eth0.
# DHCP requests of clients are passed to the DHCP server in the network.

# exit if anything goes wrong
set -e

# install needed packages
sudo apt update
sudo apt -y install hostapd bridge-utils

# disable dhcp client and wpa_supplicant for the wireless interface
sudo echo 'denyinterfaces wlan0' >> /etc/dhcpcd.conf

# use AP configuration at this path
sudo echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' >> /etc/default/hostapd
# copy the actual configuration to destination
sudo cp hostapd.conf /etc/hostapd/hostapd.conf

# create bridge
sudo brctl addbr br0
# add add ethernet interface to bridge
sudo brctl addif br0 eth0

# configure network interfaces
sudo cp ifcfg-wifi_ap /etc/network/interfaces.d/

# start hostapd service
sudo systemctl unmask hostapd
sudo systemctl enable hostapd

# start wifi interface
sudo ifconfig wlan0 up

echo 'Finished setting up!'
# reboot to apply configuration and start hostapd service
echo 'Please reboot now.'
