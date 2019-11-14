# Raspberry Pi Wireless AP w/ DHCP pass-through 
Set up a Raspberry Pi 2B as wifi access point (AP).

The script creates a bridge between a local ethernet interface and a wifi interface:
```
[DHCP server] <--> eth0 <--> [RPi] <--> wlan0 <--> [wireless device]
```
The AP will obtain an IP address via DHCP through eth0.
DHCP requests of clients are passed to the DHCP server in the network.
The AP gets configured to use the exisiting DHCP server.

## Usage
Run the installation script:
```
sudo ./setup.sh
```
Reboot afterwards.  

## System Information
Tested on:
- Raspberry Pi 2B rev 1.1 with Raspbian Buster Lite
