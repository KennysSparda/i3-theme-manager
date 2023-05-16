#!/usr/bin/bash

pwd=/home/swygax/.config/i3-theme-manager
themes=$pwd/themes

# Check if directory exists
if [[ ! -d ~/.config/wallpaper/ ]]; then
  mkdir -p ~/.config/wallpaper/
fi 

function setWallpaperAndReload(){
  nitrogen --set-zoom-fill ~/.config/wallpaper/image
  $pwd/monitor-sizes.sh
  i3-msg reload
  i3-msg restart
}

function changeToRed(){
  cp $themes/red/config $pwd/config_template
  $pwd/monitor-sizes.sh
  cp $themes/red/image ~/.config/wallpaper/
  setWallpaperAndReload
}

function changeToBlue(){
  cp $themes/blue/config $pwd/config_template
  $pwd/monitor-sizes.sh
  cp $themes/blue/image ~/.config/wallpaper/
  setWallpaperAndReload
}

function changeToGreen(){
  cp $themes/green/config $pwd/config_template
  $pwd/monitor-sizes.sh
  cp $themes/green/image ~/.config/wallpaper/
  setWallpaperAndReload
}

function changeToPurple(){
  cp $themes/purple/config $pwd/config_template
  ./monitor-sizes.sh
  cp $themes/purple/image ~/.config/wallpaper/
  setWallpaperAndReload
}

menu() {
  option=$(zenity --list --height="300" --title="Change theme" --column="Themes" "Red" "Blue" "Green" "Purple" "Exit")

  case $option in
    Red)
      changeToRed
      ;;
    Blue)
      changeToBlue
      ;;
    Green)
      changeToGreen
      ;;
    Purple)
      changeToPurple
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
