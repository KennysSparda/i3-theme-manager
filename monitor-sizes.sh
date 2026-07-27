#!/bin/bash

monitor1="eDP-1"
resolution1="1920x1080"

monitor2="HDMI-1"
resolution2="1920x1080"

monitor3="DP-2"
resolution3="1920x1080"

# Gera o arquivo de configuração
sed "s/{MONITOR1}/$monitor1/g; s/{RESOLUTION1}/$resolution1/g; s/{MONITOR2}/$monitor2/g; s/{RESOLUTION2}/$resolution2/g; s/{MONITOR3}/$monitor3/g; s/{RESOLUTION3}/$resolution3/g" ~/.config/i3-theme-manager/config_template > /tmp/i3_config_template_1

echo "Gerado com sucesso!"
