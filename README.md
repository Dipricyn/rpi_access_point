# Raspberry Pi Wireless AP w/ DHCP pass-through 
Configure a Raspberry Pi 2 to act as a wireless access point (AP).
This creates a bridge between a local ethernet interface and a wifi interface:
```
[DHCP server] <--> eth0 <--> [RPi] <--> wlan0 <--> [wireless device]
```
The AP gets configured to use an exisiting DHCP server in the network.

## Usage
Run the installation script:

```
sudo ./setup.sh
```
After that reboot.

## System Information
Tested on Raspberry Pi 2B rev 1.1 with Raspbian Buster Lite
