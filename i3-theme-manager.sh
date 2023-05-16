#!/usr/bin/bash

theme_manager_dir=~/.config/i3-theme-manager
themes_dir=$theme_manager_dir/themes
wallpaper_dir=~/.config/wallpaper

# Verificar se o diretório existe
mkdir -p $wallpaper_dir

function setWallpaperAndReload() {
  nitrogen --set-zoom-fill "$wallpaper_dir/image"
  $theme_manager_dir/monitor-sizes.sh
  i3-msg reload
  i3-msg restart
}

function changeTheme() {
  theme=$1
  cp "$themes_dir/$theme/config" "$theme_manager_dir/config_template"
  $theme_manager_dir/monitor-sizes.sh
  cp "$themes_dir/$theme/image" "$wallpaper_dir/"
  setWallpaperAndReload
}

menu() {
  options=("red" "blue" "green" "purple" "Exit")
  theme=$(zenity --list --height="300" --title="Change theme" --column="Themes" "${options[@]}")

  case $theme in
    red|blue|green|purple)
      changeTheme "$theme"
      ;;
    Exit)
      exit -1
      ;;
    *)
      exit -1
      ;;
  esac
}

menu
