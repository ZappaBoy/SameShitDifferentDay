#!/bin/bash

##################
###  ZappaBoy  ###
##################

# Define Color
NC='\033[0m'
RED='\033[31m'
GREEN='\033[32m'

YOUTUBE_SEARCH_BASE_URL='https://www.youtube.com/results?search_query='
TELEGRAM_PATH="/home/${USER}/Desktop/Programs/Telegram/Telegram"

CACHE="/home/${USER}/.cache/.same-shit-different-day.cache"

function generate_url (){
    local SEARCH_STRING=${1}
    for i in "${@:2}"; do
	SEARCH_STRING+='+'${i}
    done
    echo "${YOUTUBE_SEARCH_BASE_URL}${SEARCH_STRING}"
}

echo -e "${RED}---------- Same shit different day ----------${NC}"

echo -e "${GREEN}---------- Starting Telegram ----------${NC}"
nohup "${TELEGRAM_PATH}" >/dev/null 2>&1 &

echo -e "${GREEN}---------- Starting Discord ----------${NC}"
nohup discord >/dev/null 2>&1 &

sleep 3 && wmctrl -i -a "${WINDOWID}"

read -p "Play music [Y/n]? " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "\n"
    LAST_SEARCH=$(cat "${CACHE}")
    read -r -a TO_SEARCH -p "What kind of music do you want to listen today [${LAST_SEARCH}]? "

    if [ -z "${TO_SEARCH}" ]; then
	TO_SEARCH=${LAST_SEARCH}
    else
	echo "${TO_SEARCH[@]}" > "${CACHE}"
    fi

    echo -e "${GREEN}---------- Starting Youtube ----------${NC}"
    YOUTUBE_URL=$(generate_url "${TO_SEARCH[@]}")
    nohup xdg-open "${YOUTUBE_URL}" >/dev/null 2>&1 &
else
    echo -e "\n${RED}Seriously...?${NC}\n"
fi

# Perform auto update
echo -e "${GREEN}---------- Updating System ----------${NC}"
sudo pacman -Syyuu --noconfirm

echo -e "\n${RED}"
cat << _EOF_
.... ........,..,...................,...... ... ....... ...... .....................................
....,,,..,,,.,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,..
...*******************//************/**/*****************/*******/********/********//***/*****/**/..
...*****/*************/**********/**//*/**/***********/*****/*****/********/***********//*********..
...****/****//**/****///////********////*********/****/*//***//**/*/*/**********/*///**/**********..
...*****/********//*////*//********/////***//*******/*////****/**/**/***//*//*/*/*/*////**********..
...*/*****/*********/*//**********////*/*/***/**///////*/******/*****/*****/**/***//*//*/*/*/*/***..
...****/****/*********...........***//*********//***///*******/****.........../***///**/****/*****..
...*********/********/...............***********//*///////*****,..............***/**/*/**/******/*..
...********/*/**/*/**/*/*/*/*.... ......***/*/**/*////*///**.... ......*******/*/*//////***/******..
...*******/***/*****////*//**/*** ........ ./*/**//*/*/*,. ......../****////*//**/////////*/*****/..
...******/*/**/******//////*****/*/*,..........*//***...........**//*/**//***/////////*/**********..
...******//********/**//*/**** ......./*.......**/***.......**......../*//******/////**/**/*******..
...***/*/************///**/*..... ......,//******/**/*******. .. ........***/*///*/////*/********/..
...****/******/***/**///**/. .... .......****/*///***/**//*. ... ........*****/*//*/****/**/**/***..
...*******////*******/*////...... .......*//*//**/*/*******..... ......../*//*///*/*/////////*///*..
...*/****/**//*//*/*///////*.... .......*//**/*/*/**/**//***.  . .......*/****/*/*//////////////**..
...*/*////////**/*/*////*/////**....*///*////*//****/*/*//*//***....*/////*/*///**///////////*///*..
...*//**//////****/**///*////*/***////////////**//*//////**////*/*/////*/***/**//*///////////*//**..
...**/*//////*/*/*/*//*/*/////**//*//*//////*//****////*//////*///////////////*............////*/*..
...//*/*///****/**//////*///*/***/**/////*/////*//**///////////*/////////////**...........*//*****..
...**///////////*//*////////*///*/////////////////*/*//**////*//////////////**//**......//////**/*..
...**//////////***//////**////////*///*/////////////*//////**///*////////////*///.......***/**/**/..
. .//////////////////////////////*////////*/////*/*/*/////**////*//////*//*//*/*/....../////******..
.../////////////////////////*/////////////*////*/////*/*/*****//*////*/*//*///**......*//*******/*..
...////////////,.....*////////////////////**/*/**////*/*/**/*/**///*//**//**//.......*///*//*/****..
...*////////////......./////////*///////**/////*/*/**/**/*////*//*//**////***......./////**/****/*..
...//////////////......../////*////////////****//****/////****//*/*////****.......,/********/*****..
...////////////*/*/........./////**/////////***/***//**////*////*/////**.........*///////////*****..
...**/*////////*/////..........*////////////*****/*//////////****/***..... ...*///////////////****..
...***///////////**/////...........***//////***/****//**///******..... .....**///***/////////*/***..
...***//*////***////////*//.............,/*****************...... .......*/**//*/*////****////****..
...**//////***//**/////////**/*................................. ..../**/*****/*/////////*********..
.../***/*///**/*/****//*/**//*******,........... .......... ...,/*/*/***/******/******************..
...***//////****/*////*/*//*********////*/*****,,,.,****/****/**///*//*/*******//*/**/************..
...****////*//*****//**/***/*******/***/***********///*****//*//*//*/***/*****/***************/***..
...**/**//////********/*************/***************/***/**************/**************************..
...***///*******/********************/*/****************/****************/************************..
...******/******************************************************************************/*********..
............................................ .... .............. ............ . . ........ .. ......
_EOF_

echo -e "${RED}---------- Have a nice day ${USER}! ----------${NC}"
