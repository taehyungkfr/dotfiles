#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

if [[ ! -f $HOME/.vim/autoload/plug.vim ]]; then
  curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

files=(`find $HOME/dotfiles -maxdepth 1 -type f -name ".*" -exec basename {} \;`)
for f in "${files[@]}"; do
  ln -vsf $PWD/$f $HOME/$f
done
