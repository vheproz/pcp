#!/bin/sh

PIN_OUT=40
PIN_OUT_STATE=0

pcp-gpio mode $PIN_OUT out
pcp-gpio write $PIN_OUT 0

while true
do

        PIN1_IN_STATE=$(pcp-gpio read 18) # 17
        PIN2_IN_STATE=$(pcp-gpio read 18)
        PIN3_IN_STATE=$(pcp-gpio read 23)
        PIN4_IN_STATE=$(pcp-gpio read 5)
        PIN5_IN_STATE=$(pcp-gpio read 25)
        PIN6_IN_STATE=$(pcp-gpio read 24)
        PIN7_IN_STATE=$(pcp-gpio read 22)
        PIN8_IN_STATE=$(pcp-gpio read 27)

#       echo $PIN1_IN_STATE
#       echo $PIN2_IN_STATE
#       echo $PIN3_IN_STATE
#       echo $PIN4_IN_STATE
#       echo $PIN5_IN_STATE
#       echo $PIN6_IN_STATE
#       echo $PIN7_IN_STATE
#       echo $PIN8_IN_STATE

        if [ $PIN1_IN_STATE -eq 0 ] ; then
                PIN_OUT_STATE=1
        elif [ $PIN2_IN_STATE -eq 0 ] ; then
                PIN_OUT_STATE=1
        elif [ $PIN3_IN_STATE -eq 0 ] ; then
                PIN_OUT_STATE=1
        elif [ $PIN4_IN_STATE -eq 0 ] ; then
                PIN_OUT_STATE=1
        elif [ $PIN5_IN_STATE -eq 0 ] ; then
                PIN_OUT_STATE=1
        elif [ $PIN6_IN_STATE -eq 0 ] ; then
                PIN_OUT_STATE=1
        elif [ $PIN7_IN_STATE -eq 0 ] ; then
                PIN_OUT_STATE=1
        elif [ $PIN8_IN_STATE -eq 0 ] ; then
                PIN_OUT_STATE=1
        else
                PIN_OUT_STATE=0
        fi


        if [ $PIN_OUT_STATE -eq 0 ] ; then
                # echo PIN_OUT=0
                pcp-gpio write $PIN_OUT 0
        else
                # echo PIN_OUT=1
                pcp-gpio write $PIN_OUT 1
        fi

sleep 0.2
# break
done
