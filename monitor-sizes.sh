#!/bin/bash

# Leitura das configurações dos monitores
xrandr > display_config.txt

# Função para obter o nome do monitor e a resolução
get_monitor_info() {
    local monitor_info=$(grep "$1" display_config.txt)
    local monitor_resolution=$(echo "$monitor_info" | awk '{print $3}')
    
    # Verificar se a resolução é "primary" e atribuir um valor padrão se necessário
    if [ "$monitor_resolution" = "primary" ]; then
        case "$1" in
            HDMI*) monitor_resolution="1920x1080" ;;  # Valor padrão para HDMI
            VGA*) monitor_resolution="1024x768" ;;   # Valor padrão para VGA
        esac
    fi
    
    echo "$monitor_resolution"
}

# Verificar o nome e a resolução do monitor HDMI
if grep -q "HDMI" display_config.txt; then
    HDMI_MONITOR=$(grep "HDMI" display_config.txt | awk '{print $1}')
    HDMI_RESOLUTION=$(get_monitor_info "$HDMI_MONITOR")
else
    HDMI_MONITOR="HDMI-A-0"  # Valor padrão caso HDMI não esteja disponível
    HDMI_RESOLUTION="1920x1080"  # Valor padrão para HDMI
fi

# Verificar o nome e a resolução do monitor VGA
if grep -q "VGA" display_config.txt; then
    VGA_MONITOR=$(grep "VGA" display_config.txt | awk '{print $1}')
    VGA_RESOLUTION=$(get_monitor_info "$VGA_MONITOR")
else
    VGA_MONITOR="VGA-0"  # Valor padrão caso VGA não esteja disponível
    VGA_RESOLUTION="1024x768"  # Valor padrão para VGA
fi

# Exibir as configurações obtidas
echo "HDMI_MONITOR: $HDMI_MONITOR"
echo "HDMI_RESOLUTION: $HDMI_RESOLUTION"
echo "VGA_MONITOR: $VGA_MONITOR"
echo "VGA_RESOLUTION: $VGA_RESOLUTION"

# Exemplo de configurações estáticas
# HDMI_MONITOR="HDMI-A-0"
# HDMI_RESOLUTION="1920x1080"
# VGA_MONITOR="VGA-0"
# VGA_RESOLUTION="1024x768"

# Geração do arquivo config substituindo todas as ocorrências pelo valor estático declarado acima
sed "s/{HDMI_MONITOR}/$HDMI_MONITOR/g; s/{HDMI_RESOLUTION}/$HDMI_RESOLUTION/g; s/{VGA_MONITOR}/$VGA_MONITOR/g; s/{VGA_RESOLUTION}/$VGA_RESOLUTION/g" ./config_template > ~/.config/i3/config 

echo "Arquivo monitor-sizes.sh gerado com sucesso!"