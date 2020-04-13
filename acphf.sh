#!/bin/bash

DASH_LINE============================================

show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Install HF5 ${normal}\n"
    printf "${menu}**${number} 2)${menu} Install HF6 ${normal}\n"
    printf "${menu}**${number} 3)${menu} Install HF7 ${normal}\n"
    printf "${menu}**${number} 4)${menu} Install HF8 ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Please enter a menu option and enter or ${fgred}x to exit. ${normal}"
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

function installhf5() {
    echo "installing HF5"
    echo $DASH_LINE

    wget http://10.148.28.252/ISO/CloudPlatform-4.11.0.5_HF_05.zip -P /root/
    unzip /root/CloudPlatform-4.11.0.5_HF_05.zip -d /root/
    cd /root/CloudPlatform-4.11.0.5_HF_05
    sh /root/CloudPlatform-4.11.0.5_HF_05/install-patch.sh

    echo $DASH_LINE
}


function installhf6() {
    echo "installing HF6"
    echo $DASH_LINE

    wget http://10.148.28.252/ISO/CloudPlatform-4.11.0.6_HF_06.zip -P /root/
    unzip /root/CloudPlatform-4.11.0.6_HF_06.zip -d /root/
    cd /root/CloudPlatform-4.11.0.6_HF_06
    sh /root/CloudPlatform-4.11.0.6_HF_06/install-patch.sh

    echo $DASH_LINE
}

function installhf7() {
    echo "installing HF7"
    echo $DASH_LINE

    wget http://10.148.28.252/ISO/CloudPlatform-4.11.0.7_HF_07.zip -P /root/
    unzip /root/CloudPlatform-4.11.0.7_HF_07.zip -d /root/
    cd /root/CloudPlatform-4.11.0.7_HF_07
    sh /root/CloudPlatform-4.11.0.7_HF_07/install-patch.sh

    echo $DASH_LINE
}

function installhf8() {
    echo "installing HF8"
    echo $DASH_LINE

    wget http://10.148.28.252/ISO/CloudPlatform-4.11.0.8_HF_08.zip -P /root/
    unzip /root/CloudPlatform-4.11.0.8_HF_08.zip -d /root/
    cd /root/CloudPlatform-4.11.0.8_HF_08
    sh /root/CloudPlatform-4.11.0.8_HF_08/install-patch.sh

    echo $DASH_LINE
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear;
            option_picked "Option 1 Picked";
            echo "Starting hf5 installtion script";
             installhf5
            show_menu;
        ;;
        2) clear;
            option_picked "Option 2 Picked";
            echo "Starting hf6 installtion script";
             installhf6
            show_menu;
        ;;
        3) clear;
            option_picked "Option 3 Picked";
            echo "Starting hf7 installtion script";
             installhf7
            show_menu;
        ;;
        4) clear;
            option_picked "Option 4 Picked";
            echo "Starting hf8 installtion script";
             installhf8
            show_menu;
        ;;
        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
done
