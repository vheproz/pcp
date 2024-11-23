#!/bin/sh

#========================================================================================
# Multiroom Player
#----------------------------------------------------------------------------------------
# squeezelite -S /home/tc/start_mm_player.sh
#
# Start all player
#----------------------------------------------------------------------------------------

/usr/local/bin/squeezelite -n "piCorePlayer1" -o monofrontl -a 80:::0: -m af:cf:eb:14:39:01 -C 1 -G 18:L -z
/usr/local/bin/squeezelite -n "piCorePlayer2" -o monofrontr -a 80:::0: -m af:cf:eb:14:39:02 -C 1 -G 17:L -z
/usr/local/bin/squeezelite -n "piCorePlayer3" -o monocenterl -a 80:::0: -m af:cf:eb:14:39:03 -C 1 -G 23:L -z
/usr/local/bin/squeezelite -n "piCorePlayer4" -o monocenterr -a 80:::0: -m af:cf:eb:14:39:04 -C 1 -G  5:L -z
/usr/local/bin/squeezelite -n "piCorePlayer5" -o monobackl -a 80:::0: -m af:cf:eb:14:39:05 -C 1 -G 25:L -z
/usr/local/bin/squeezelite -n "piCorePlayer6" -o monobackr -a 80:::0: -m af:cf:eb:14:39:06 -C 1 -G 24:L -z
/usr/local/bin/squeezelite -n "piCorePlayer7" -o monosurroundl -a 80:::0: -m af:cf:eb:14:39:07 -C 1 -G 22:L -z
/usr/local/bin/squeezelite -n "piCorePlayer8" -o monosurroundr -a 80:::0: -m af:cf:eb:14:39:08 -C 1 -G 27:L -z
# /usr/local/bin/squeezelite -n piCorePlayer -o monosurroundl -a 80 4  0
