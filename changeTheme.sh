#!/usr/bin/bash

themes=/home/swygax/.config/i3theme/themes

# Check if directory exists
if [[ ! -d ~/.config/wallpaper/ ]]; then
  mkdir -p ~/.config/wallpaper/
fi

function setWallpaper(){
  nitrogen --set-zoom-fill ~/.config/wallpaper/image
}

function changeToRed(){
  cp $themes/red/config ~/.config/i3/
  cp $themes/red/image ~/.config/wallpaper/
  setWallpaper
  i3-msg reload
  i3-msg restart
}

function changeToBlue(){
  cp $themes/blue/config ~/.config/i3/
  cp $themes/blue/image ~/.config/wallpaper/
  setWallpaper
  i3-msg reload
  i3-msg restart
}

function changeToGreen(){
  cp $themes/green/config ~/.config/i3/
  cp $themes/green/image ~/.config/wallpaper/
  setWallpaper
  i3-msg reload
  i3-msg restart
}

function changeToPurple(){
  cp $themes/purple/config ~/.config/i3/
  cp $themes/purple/image ~/.config/wallpaper/
  setWallpaper
  i3-msg reload
  i3-msg restart
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
