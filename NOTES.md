Random notes for SAMSUNG NC10 Ecko Plus:

Keys
====

Output of `showkey -s` for several keycodes (M/R/B stands for make/repeat/break or press/hold/release):

```
Key	Works?	Scancodes		Comment

Fn	-	-			not detected
Fn+ESC	?	M 0xe0 0x5f 0xe0 0xdf	Sleep/Suspend/Hibernate
Fn+F1	no	-			not detected
Fn+F2	?	M 0xe0 0x71 0xe0 0xf1	Display battery status
Fn+F3	partly	M 0x38 0x52 0xd2 0x4f	Outputs an EUR symbol under Windows
		  0xcf 0x50 0xd0 0x48	read as 0xc2 0x80 on stdin
		  0xc8 0xb8
Fn+F4	no?	M 0xe0 0x56 0xe0 0xd6	Switch to external monitor
Fn+F5	no	M 0xe0 0x1f 0xe0 0x9f	Backlight on/off
Fn+F6	?	MR 0xe0 0x20		Sound on/off
		B  0xe0 0xa0
Fn+F7	?	M 0xe0 0x17 0xe0 0x97	?
Fn+F8	?	M 0xe0 0x2b 0xe0 0xab	?
Fn+F9	?	M 0xe0 0x73 0xe0 0xf3	Display WiFi/BlueTooth toggle applet
Fn+F10	yes	M 0xe0 0x79 0xe0 0xf9	Enable scratchpad
		M 0x6d 0xed		Disable scratchpad
Fn+F11	yes	MR 0x45			NumLock
		B  0xc5
Fn+F12	yes	MR 0x46			ScrollLock
		B  0xc6
Fn+Left	?	MR 0xe0 0x2e		Sound --
		B  0xe0 0xae
Fn+Rght	?	MR 0xe0 0x30		Sound ++
		B  0xe0 0xb0
Fn+Up	?	MR 0xe0 0x54 0xe0 0xd4	Backlight ++
Fn+Down	?	MR 0xe0 0x4c 0xe0 0xcc	Backlight --
Fn+Ins	half	M  0xe1 0x1d 0x45 0xe1	Pause/Break
		   0x9d 0xc5		sends break code on keypress, too!
Fn+Entr	yes	MR 0xe0 0x1c		Numpad Enter
		B  0xe0 0x9c
```

I found no way to emulate the right windows key which sends: MR 0xe0 0x5c B 0xe0 0xdc
(My expectation was to see this with Fn+Win, but no, it does just send Win.)


LEDs
====

```
LEDs	works?	comment

Caps	no	always off, should show CapsLock state?
Disk	yes	blinks on disk access
wLAN	no	always on
Battery	yes	green:full+power red:charging+power off:no-power
Power	yes	blue:powered on

Camera	no	always off.  Is there such a LED?
```

Devices
=======

```
Device		Works?	comment

Screen		yes	1024x600 with framebuffer device, module i915 I think
Backlight	somehow	with tweaking, not via keyboard yet
Keyboard	half	missing in udev
Scratchpad	half	missing in udev
Ethernet	yes	out of the box
wLAN		yes	always on, no way found to power off, wpa-driver wext
Speakers	yes	alsa-utils
Microphone	?	probably works
Webcam		yes	somehow, not thoroughly tested
Bluetooth	?	I have no idea
Laptop-Lid	no	no udev event, no keycode, only switches off the backlight
USB2		yes	out of the box
ESATA-HDD	yes	out of the box
Cardreader	yes	out of the box
VGA-out		?	untested
Powerswitch	yes?	powers down computer, but not checked udev yet
Battery		yes	detected and in udev
Fan-control	no?	neither acpi nor udev
Sensors		partly	no fan, and i am not sure if the thermal output makes sense
```

