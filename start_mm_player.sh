#!/bin/sh

#========================================================================================
# Multiroom Player
#----------------------------------------------------------------------------------------
# squeezelite -S /home/tc/start_mm_player.sh
#
# Start all player
#
# ### Power On/Off GPIO (-G)   less> ###
# <gpio chip>:<gpio pin>:<H|L>
# For Pi 0-4 devices chip 0 is the chip connected to the 40pin header.
# For Pi [5] devices chip 4 is the chip connected to the 40pin header.
# Squeezelite will toggle this GPIO PIN when the Power On/Off button is pressed
# 
# ### Specify the ALSA params to open output device (-a)   less> ###
# <b>:<p>:<f>:<m>:<d>
# b = buffer time in ms or size in bytes 
# p = period count or size in bytes
# f = sample format (16|24|24_3|32)
# m = use mmap (0|1)
# d = opens ALSA twice (undocumented) i.e. ::::d
#----------------------------------------------------------------------------------------

/usr/local/bin/squeezelite -n "piCorePlayer1" -o monofrontl -a 80:4::0: -m af:cf:eb:14:39:01 -C 1 -G 0:18:L -z
/usr/local/bin/squeezelite -n "piCorePlayer2" -o monofrontr -a 80:4::0: -m af:cf:eb:14:39:02 -C 1 -G 0:17:L -z
/usr/local/bin/squeezelite -n "piCorePlayer3" -o monocenterl -a 80:4::0: -m af:cf:eb:14:39:03 -C 1 -G 0:23:L -z
/usr/local/bin/squeezelite -n "piCorePlayer4" -o monocenterr -a 80:4::0: -m af:cf:eb:14:39:04 -C 1 -G  0:5:L -z
/usr/local/bin/squeezelite -n "piCorePlayer5" -o monobackl -a 80:4::0: -m af:cf:eb:14:39:05 -C 1 -G 0:25:L -z
/usr/local/bin/squeezelite -n "piCorePlayer6" -o monobackr -a 80:4::0: -m af:cf:eb:14:39:06 -C 1 -G 0:24:L -z
/usr/local/bin/squeezelite -n "piCorePlayer7" -o monosurroundl -a 80:4::0: -m af:cf:eb:14:39:07 -C 1 -G 0:22:L -z
/usr/local/bin/squeezelite -n "piCorePlayer8" -o monosurroundr -a 80:4::0: -m af:cf:eb:14:39:08 -C 1 -G 0:27:L -z
