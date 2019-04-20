#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#brew install neovim

if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi

if [ ! -d ~/.config/NeoVimConfig ]; then
  cp -r '../NeoVimConfig' ~/.config/
fi

if [ ! -d ~/.config/nvim ]; then
  mv ~/.config/NeoVimConfig ~/.config/nvim
fi
