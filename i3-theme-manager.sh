#!/usr/bin/bash

theme_manager_dir=~/.config/i3-theme-manager
themes_dir=$theme_manager_dir/themes
wallpaper_dir=~/.config/wallpaper

mkdir -p "$wallpaper_dir"

function changeTheme() {
  theme=$1
  
  # 1. Gera os templates
  $theme_manager_dir/monitor-sizes.sh
  $theme_manager_dir/apply-color.sh "$theme"
  
  # 2. Atualiza a config do i3 e o wallpaper
  cp /tmp/i3_config_template_2 ~/.config/i3/config
  cp "$themes_dir/$theme/image" "$wallpaper_dir/image"
  
  # 3. Aplica o papel de parede e reinicia o i3 apenas UMA vez
  nitrogen --set-zoom-fill "$wallpaper_dir/image"
  i3-msg restart
}

menu() {
  # LÊ AS CORES ATUAIS DIRETO DO SEU I3 CONFIG EM USO
  c_primary=$(grep 'set $primary-color' ~/.config/i3/config | awk '{print $3}')
  c_secondary=$(grep 'set $secondary-color' ~/.config/i3/config | awk '{print $3}')
  c_tertiary=$(grep 'set $tertiary-color' ~/.config/i3/config | awk '{print $3}')

  # FALLBACK DE SEGURANÇA: se o config estiver em branco ou quebrado
  c_primary=${c_primary:-"#005577"}
  c_secondary=${c_secondary:-"#eeeeee"}
  c_tertiary=${c_tertiary:-"#222222"}

  options="red\nblue\ngreen\npurple\nExit"
  
  # Abre o dmenu usando as cores que já estão no seu painel
  theme=$(echo -e "$options" | dmenu -i -p "Theme:" \
    -nb "$c_tertiary" \
    -nf "$c_secondary" \
    -sb "$c_primary" \
    -sf "$c_tertiary")

  case $theme in
    red|blue|green|purple)
      changeTheme "$theme"
      ;;
    *)
      exit 0
      ;;
  esac
}

menu