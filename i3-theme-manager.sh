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
  $theme_manager_dir/monitor-sizes.sh
  $theme_manager_dir/apply-color.sh $theme
  cp /tmp/i3_config_template_2 ~/.config/i3/config
  cp "$themes_dir/$theme/image" "$wallpaper_dir/"
  setWallpaperAndReload
}

menu() {
  options=("red" "blue" "green" "purple" "Exit") # Add before "purple" the name of your theme in quotes, like this: options=("red" "blue" "green" "purple" "my-new-theme" "Exit")
  theme=$(zenity --list --height="300" --title="Change theme" --column="Themes" "${options[@]}")

  case $theme in
    red|blue|green|purple) # Add here, the name of your theme without quotes, like this: red|blue|green|purple|my-new-theme)
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
