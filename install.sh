#! /bin/bash
nvim_dir="~/.config/nvim"
if [ -d $nvim_dir ] 
then
  mv -f ~/.config/nvim ~/.config/nvim.backup
fi
mkdir ~/.config/nvim
git clone https://github.com/arisnacg/neovim ~/.config/nvim
