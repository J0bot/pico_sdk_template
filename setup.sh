#!/bin/bash
sudo apt upgrade
sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib

read -p "Already added pico-sdk to path ? (y/n) :" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    cd ~
    git clone https://github.com/raspberrypi/pico-sdk/
    cd pico-sdk
    git submodule update --init
    cd ~
    echo "export PICO_SDK_PATH=~/pico-sdk" >> '.bashrc'
    source .bashrc
fi

read -p "Reset previous installation ? (y/n) :" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    cd ~
    rm -f -r -d project_template
    #creating the project
    mkdir project_template
    cd project_template

    #setup of the CmakeLists.txt file
    wget https://raw.githubusercontent.com/J0bot/pico_sdk_template/files/CMakeLists.txt

    #setup of the pico
    wget https://raw.githubusercontent.com/J0bot/pico_sdk_template/files/pico_sdk_import.cmake

    #creation of the c file
    wget https://raw.githubusercontent.com/J0bot/pico_sdk_template/files/test.c
fi



read -p "Compile the projet ? (y/n) :" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -f -r -d build
    mkdir build
    cd build 
    cmake ..
    make test
fi
