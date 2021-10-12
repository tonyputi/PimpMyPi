#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install zsh git htop vim
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt install pavucontrol jackd2 pulseaudio-module-jack
echo "/usr/bin/pasuspender -- jackd -P75 -dalsa -dhw:b1 -r44100 -p512 -n3" | tee -a ~/.jackdrc
# pacmd set-default-sink jack_out && pacmd set-default-source jack_in && pacmd list-sink-inputs | awk '/index:/{print $2}' && xargs -I{} pacmd move-sink-input "{}" jack_out
# pacmd set-default-sink jack_out && pacmd set-default-source jack_in && pacmd list-sink-inputs | awk '/index:/{system("pacmd move-sink-input " $2 " jack_out")}'