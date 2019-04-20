#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#brew install neovim

#---------------- ~/.config/nvim setup ----------------

if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi

if [ ! -d ~/.config/NeoVimConfig ]; then
  cp -r '../NeoVimConfig' ~/.config/
fi

if [ ! -d ~/.config/nvim ]; then
  mv ~/.config/NeoVimConfig ~/.config/nvim
fi

#---------------- pyenv setup ----------------

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

#---------------- rbenv setup ----------------

#brew install rbenv
#brew install postgresql
#brew install yarn
#echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
#echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
#brew install ruby-build
#brew install rbenv-gemset
#brew install rbenv-gem-rehash

#rbenv install '2.5.0'
#rbenv rehash
#rbenv global '2.5.0'
#gem install bundler
