#!/bin/bash

##################
###  ZappaBoy  ###
##################

# Define Color
NC='\033[0m'
RED='\033[31m'
GREEN='\033[32m'

YOUTUBE_SEARCH_BASE_URL='https://www.youtube.com/results?search_query='
TELEGRAM_PATH='/home/zappaboy/Desktop/Programs/Telegram/Telegram'

function generate_url (){
    local SEARCH_STRING=${1}
    for i in "${@:2}"; do
	SEARCH_STRING+='+'${i}
    done
    echo ${YOUTUBE_SEARCH_BASE_URL}${SEARCH_STRING}
}

echo -e "${RED}---------- Same shit different day ----------${NC}"

echo -e "${GREEN}---------- Starting Telegram ----------${NC}"
${TELEGRAM_PATH}

echo -e "${GREEN}---------- Starting Discord ----------${NC}"
discord

read -p "Play music [Y/n]? " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "\n"
    read -a TO_SEARCH -p "What kind of music do you want to listen today? >  "
    echo -e "${GREEN}---------- Starting Youtube ----------${NC}"
    YOUTUBE_URL=$(generate_url ${TO_SEARCH[@]})
    chromium ${YOUTUBE_URL}
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
