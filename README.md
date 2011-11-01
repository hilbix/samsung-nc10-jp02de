This directory tracks some config files of my Samsung NC10-JP02DE, also called NC10 Ecko Plus.

Comments please to https://hydra.geht.net/pager.php

Note that **I do not run a graphical desktop** yet.  I like the commandline.

Technical data (yours may vary):

- Atom N450 @ 1.66 GHz (1 core HT)
- 2 GB RAM max (comes with 1 GB)
- 250 GB HDD, Hitachi Travelstar 5K500.B
- Intel N10 Chipset (VGA, Audio, USB, SATA) rev 02
- Active cooling, very silent
- Battery: 4400mAh 11.1V Li-Ion (48Wh) part number AA-PB2VC6W
- Power adapter: in 100-240V~ 1A 50-60Hz out 19V 1.2A, German part number ADP-40NH D.  Note: GND is outside, Positive pole is the middle (as usual)
- Wireless: Broadcom BCM4313 802.11b/g/n rev 01
- Fast Ethernet 100 MBit/s: Marvell 88E8040
- Webcam: 640x480 USB2.0 idVendor 0x0ac8(Z-Star) idProduct=0xc33f(Webcam)
- Bluetooth: USB2.0 (on USB1.1 hub) idVendor=0xa5c(Broadcom) idProduct=0x219c(?)
- Comes with Win7 starter, can run Debian Squeeze
- Runs up to 6 hours, 8 hours with max Win7 power saving (permanent idle)
- Runs 4 hrs under Linux with battery at 80% setting

Things which do not work under Linux (and I do not know how to fix it yet):

- some LEDs: Webcam (permanent off), wLAN (permanent on)
- Keyboard FN functions (switching wLAN on/off, brigtness settings, etc.)
- Bluetooth (not tried yet)

Things which worked under Linux out of the box:

- Webcam, very low quality (via Video4Linux), see https://github.com/hilbix/pytino/tree/master/recipe/webcam.py
- Scratchpad `apt-get install gpm`
- Audio, Microphone, Beeper `apt-get install alsa-utils; amixer sset Beep 100% unmute`

Things I got working:

- Backlight: see usr/local/sbin/backlight
- Battery monitoring script: see http://www.scylla-charybdis.com/tool.php/udevraw

