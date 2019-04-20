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

#brew install pyenv
#echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

#exec $SHELL -l

#sudo installer -pkg '/Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg' -target /

#pyenv install '3.7.0'

#pyenv install 'anaconda3-5.2.0'

#pyenv global '3.7.0'

#pip install 'autopep8'
#pip install 'black'
#pip install 'isort'
#pip install 'flake8'
#pip install 'pynvim'
#pip install 'jedi'

#pyenv global 'anaconda3-5.2.0'

#pip install 'jedi'
#pip install 'pynvim'

#pyenv global 'system'
