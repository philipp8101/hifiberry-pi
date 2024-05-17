#!/usr/bin/env bash
set -e

apt update -y
apt upgrade -y
apt install -y mopidy python3-pip pulseaudio

curl https://repo.jellyfin.org/install-debuntu.sh |sed '136d' | bash

pip3 install mopidy-jellyfin mopidy-musicbox-webclient --break-system-packages

cp mopidy.conf /etc/mopidy/mopidy.conf
cp config.txt /boot/config.txt
cp default.pa /etc/pulse/default.pa

systemctl enable mopidy

su $(id -un 1000) pactl set-default-sink alsa_output.platform-soc_sound.stereo-fallback

reboot

