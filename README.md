# Anmelden
* User: tc
* Password: piCore
# Asound
* ```ll /etc/```
* ```cp /etc/asound.conf /etc/asound.back```
* ```vi /etc/asound.conf```

# pcp
Customization Files and Settings for PiCorePlayer

Main Page
*Additional functions*
Resize FS vollständing
Static IP

Tweaks
*pCP System Tweaks*
HDMI Power Off
*Audio tweaks*
Squeezelite No

Squeezelite Settings
*Audio output device settings*
USB Audio

# Standard Player
```/usr/local/bin/squeezelite -n piCorePlayer -a 80 4  0```
Für Test geändert zu
```/usr/local/bin/squeezelite -n piCorePlayer -o monosurroundl -a 80 4  0```
## Zusatzplayer
### piCorePlayer 3.02
```/mnt/mmcblk0p2/tce/squeezelite-armv6hf -n "piCorePlayer2" -o stereosurround -a 80:::0: -m ab:cd:ef:12:34:02 -C 1 -G 8:L -z```
### ab piCorePlayer 3.11
```/usr/local/bin/squeezelite -n "piCorePlayer2" -o stereosurround -a 80:::0: -m ab:cd:ef:12:34:02 -C 1 -G 8:L -z```
