#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# if [[ 2 != $(xfconf-query -c xsettings -p /Gdk/WindowScalingFactor) ]]; then
#   xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 2
# fi
# if [[ "Default-xhdpi" != $(xfconf-query -c xfwm4 -p /general/theme) ]]; then
#   xfconf-query -c xfwm4 -p /general/theme -s Default-xhdpi
# fi

if [[ ! -d $HOME/.oh-my-zsh ]]; then
 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
fi

if [[ ! -d $HOME/yay ]]; then
  git clone https://aur.archlinux.org/yay-bin.git $HOME/yay
  sh -c "cd $HOME/yay && makepkg -si"
fi


if [[ ! -f $HOME/.vim/autoload/plug.vim ]]; then
  curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [[ ! -d $HOME/.fzf ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  $HOME/.fzf/install
fi

files=(`find $PWD -maxdepth 1 -type f -name ".*" -exec basename {} \;`)
for f in "${files[@]}"; do
  ln -vsf $PWD/$f $HOME/$f
done
