#!/usr/bin/bash

set -e

message() {
  printf "%s! ✅ \n" "$1" 
}

apt_prepare() {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

main_package() {
  # `curl`, `git`, `build-essential`, `gnome-tweaks` & `zsh`
  sudo apt install -y curl git build-essential gnome-tweaks zsh
  
  message "'Main Packages' Installed"
}

zsh() {
  # Change default shell to `zsh` 
  chsh -s "$(which zsh)"

  message "'Zsh' Activated!"
}

apt_prepare && main_package && zsh
