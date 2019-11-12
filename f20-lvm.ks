url --url=http://secondary.fedoraproject.org/pub/archive/fedora-secondary/releases/20/Fedora/s390x/os/
text
#vnc

part pv.01 --grow --size 1
volgroup Fedora --pesize=32768 pv.01
logvol /  --grow --size=2048 --name=Root --vgname=Fedora
logvol /boot  --size=500 --name=Boot --vgname=Fedora
logvol swap  --fstype="swap" --size=2048 --name=Swap --vgname=Fedora

zerombr
bootloader --location=mbr
clearpart --all --initlabel


logging --level=debug
rootpw --plaintext fedora
firewall --enabled
keyboard us
lang en_US
timezone --isUtc America/New_York
poweroff

## uncomment for Minimal install
%packages --ignoremissing
## uncomment for Default install (GNOME)
#%packages --ignoremissing --default

%end
