theme=$1

case $theme in
  red)
    primarycolor="#ff0000"
    secundarycolor="#aaaaaa"
    tertiarycolor="#000000"
    ;;
  blue)
    primarycolor="#0000ff"
    secundarycolor="#aaaaaa"
    tertiarycolor="#000000"
    ;;
  green)
    primarycolor="#00ff00"
    secundarycolor="#aaaaaa"
    tertiarycolor="#000000"
    ;;
  purple)
    primarycolor="#ff00ff"
    secundarycolor="#aaaaaa"
    tertiarycolor="#000000"
    ;;
  # CREATE YOUR OWN PALETE HERE
  # my-new-theme)
  #   primarycolor="#ffff00"
  #   secundarycolor="#aaaaaa"
  #   tertiarycolor="#000000"
  #   ;;
  *)
    echo "Error 42"
    exit -1
    ;;
esac

sed "s/{PRIMARYCOLOR}/$primarycolor/g; s/{SECUNDARYCOLOR}/$secundarycolor/g; s/{TERTIARYCOLOR}/$tertiarycolor/g" /tmp/i3_config_template_1 > /tmp/i3_config_template_2

echo "Gerado template 2"


# -- NOVO CÓDIGO ABAIXO --
# Garantir que a pasta do conky exista
mkdir -p ~/.config/conky

# Gerar o arquivo final do conky com as cores do tema
sed "s/{PRIMARYCOLOR}/$primarycolor/g; s/{SECUNDARYCOLOR}/$secundarycolor/g; s/{TERTIARYCOLOR}/$tertiarycolor/g" ~/.config/i3-theme-manager/shortcuts_template.conf > ~/.config/conky/shortcuts.conf
echo "Gerado conky shortcuts.conf"

# Reiniciar o conky para a nova cor aparecer imediatamente
killall conky 2>/dev/null
conky -c ~/.config/conky/shortcuts.conf -d 2>/dev/null