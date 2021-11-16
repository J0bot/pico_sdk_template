#!/bin/bash
sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib
cd ~
git clone https://github.com/raspberrypi/pico-sdk/
cd pico-sdk
git submodule update --init
cd ~
echo "export PICO_SDK_PATH=~/pico-sdk" >> '.bashrc'
source .bashrc

#creating the project
mkdir project_template
cd project_template

#setup of the CmakeLists.txt file
wget https://raw.githubusercontent.com/J0bot/pico_tests/files/CMakeLists.txt
