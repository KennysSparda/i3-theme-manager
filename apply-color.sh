theme=$1

case $theme in
  red)
    primarycolor="#ff0000"
    secundarycolor="#333333"
    tertiarycolor="#000000"
    ;;
  blue)
    primarycolor="#0000ff"
    secundarycolor="#333333"
    tertiarycolor="#000000"
    ;;
  green)
    primarycolor="#00ff00"
    secundarycolor="#333333"
    tertiarycolor="#000000"
    ;;
  purple)
    primarycolor="#ff00ff"
    secundarycolor="#333333"
    tertiarycolor="#000000"
    ;;
  *)
    echo "Error 42"
    exit -1
    ;;
esac

sed "s/{PRIMARYCOLOR}/$primarycolor/g; s/{SECUNDARYCOLOR}/$secundarycolor/g; s/{TERTIARYCOLOR}/$tertiarycolor/g" /tmp/i3_config_template_1 > /tmp/i3_config_template_2

echo "Gerado template 2"

