#!/bin/bash

monitor1="eDP"
resolutuion1="1366x768"

monitor2="HDMI-A-0"
resolution2="1920x1080"

# Gera o arquivo de configuração
sed "s/{MONITOR1}/$monitor1/g; s/{RESOLUTION1}/$resolution1/g; s/{MONITOR2}/$monitor2/g; s/{RESOLUTION2}/$resolution2/g" ~/.config/i3-theme-manager/config_template > /tmp/i3_config_template_1

echo "Gerado com sucesso!"
