#!/usr/bin/env bash
#usage = curl -k -L https://raw.githubusercontent.com/derhund88/Linux-Automation/refs/heads/main/install-tool.sh | sh
set -e

echo "===================================="
echo " Ubuntu Pentest Toolkit Installer"
echo "===================================="

sudo apt update
sudo apt -y upgrade

############################################
# Basic packages
############################################

sudo apt install -y \
git curl wget unzip zip tar gzip \
build-essential cmake make gcc g++ \
python3 python3-pip python3-venv \
golang-go \
openjdk-21-jdk \
default-jre \
default-jdk \
ruby-full \
nodejs npm \
docker.io docker-compose-v2 \
net-tools \
software-properties-common \
ca-certificates \
apt-transport-https \
jq \
vim nano tmux \
tree \
htop \
neofetch

############################################
# Networking
############################################

sudo apt install -y \
nmap \
masscan \
netcat-openbsd \
tcpdump \
tshark \
wireshark \
arp-scan \
fping \
hping3 \
dsniff \
ettercap-common \
ettercap-graphical \
whois \
dnsutils \
netdiscover \
traceroute

############################################
# Wireless
############################################

sudo apt install -y \
aircrack-ng \
reaver \
bully

############################################
# Web Pentest
############################################

sudo apt install -y \
nikto \
sqlmap \
wapiti \
whatweb \
ffuf \
dirb \
dirbuster \
gobuster

############################################
# Password
############################################

sudo apt install -y \
john \
hashcat \
hashid \
cewl

############################################
# Exploitation
############################################

sudo apt install -y \
exploitdb \
searchsploit

############################################
# Reverse Engineering
############################################

sudo apt install -y \
radare2 \
gdb \
gdb-multiarch \
binwalk \
foremost \
strings

############################################
# Forensics
############################################

sudo apt install -y \
sleuthkit \
autopsy \
dc3dd \
testdisk \
exiftool

############################################
# SMB
############################################

sudo apt install -y \
smbclient \
enum4linux

############################################
# SNMP
############################################

sudo apt install -y \
snmp \
snmpd \
snmp-mibs-downloader

############################################
# LDAP
############################################

sudo apt install -y \
ldap-utils

############################################
# Hydra
############################################

sudo apt install -y hydra

############################################
# CrackMapExec Replacement
############################################

python3 -m pip install --break-system-packages \
netexec

############################################
# Impacket
############################################

python3 -m pip install --break-system-packages \
impacket

############################################
# BloodHound.py
############################################

python3 -m pip install --break-system-packages \
bloodhound

############################################
# LDAP3
############################################

python3 -m pip install --break-system-packages \
ldap3

############################################
# Scapy
############################################

python3 -m pip install --break-system-packages \
scapy

############################################
# pwntools
############################################

python3 -m pip install --break-system-packages \
pwntools

############################################
# pwndbg
############################################

git clone https://github.com/pwndbg/pwndbg ~/pwndbg || true
cd ~/pwndbg
./setup.sh
cd ~

############################################
# RustScan
############################################

cargo_installed=$(command -v cargo || true)

if [ -z "$cargo_installed" ]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source "$HOME/.cargo/env"
fi

cargo install rustscan || true

############################################
# Amass
############################################

go install github.com/owasp-amass/amass/v4/...@master

############################################
# Subfinder
############################################

go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

############################################
# Httpx
############################################

go install github.com/projectdiscovery/httpx/cmd/httpx@latest

############################################
# Katana
############################################

go install github.com/projectdiscovery/katana/cmd/katana@latest

############################################
# Nuclei
############################################

go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

############################################
# Naabu
############################################

go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest

############################################
# Notify
############################################

go install github.com/projectdiscovery/notify/cmd/notify@latest

############################################
# DNSX
############################################

go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest

############################################
# Assetfinder
############################################

go install github.com/tomnomnom/assetfinder@latest

############################################
# Waybackurls
############################################

go install github.com/tomnomnom/waybackurls@latest

############################################
# Gf
############################################

go install github.com/tomnomnom/gf@latest

############################################
# Gf Patterns
############################################

mkdir -p ~/.gf

git clone https://github.com/1ndianl33t/Gf-Patterns ~/Gf-Patterns || true
cp ~/Gf-Patterns/*.json ~/.gf/

############################################
# Feroxbuster
############################################

curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/main/install-nix.sh | bash

############################################
# SecLists
############################################

sudo apt install -y seclists

############################################
# Wordlists
############################################

sudo apt install -y wordlists

############################################
# Enable Docker
############################################

sudo systemctl enable docker
sudo systemctl start docker

############################################
# PATH
############################################

echo 'export PATH=$PATH:$HOME/go/bin:$HOME/.local/bin' >> ~/.bashrc

############################################

############################################
# Burp Suite (Official PortSwigger)
############################################

echo "[+] Installing Burp Suite..."

mkdir -p /tmp/burp
cd /tmp/burp

# Download latest Linux x64 installer
wget -O burpsuite_linux.sh \
https://portswigger.net/burp/releases/startdownload?product=community&platform=Linux

chmod +x burpsuite_linux.sh

echo
echo "Launching Burp installer..."
echo

sudo ./burpsuite_linux.sh

cd ~

rm -rf /tmp/burp
############################################
# Burp Suite (Official PortSwigger) Done
############################################

echo ""
echo "===================================="
echo " Installation Finished"
echo "Restart terminal or:"
echo ""
echo "source ~/.bashrc"
echo ""
echo "===================================="

