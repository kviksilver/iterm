#!/bin/zsh

echo "make sure you have xcode and iterm installed before proceeding"
read -s -k '?Press any key to continue.'


chsh -s /bin/zsh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/fonts
brew cask install font-fira-code
brew install emacs

rm -rf "${ZDOTDIR:-$HOME}/.emacs.d"

rm -rf "${ZDOTDIR:-$HOME}/.zprezto"
git clone https://github.com/kviksilver/emacs.git "${ZDOTDIR:-$HOME}/.emacs.d"
git clone https://github.com/kviksilver/prezto.git -b myconfig "${ZDOTDIR:-$HOME}/.zprezto"
cd "${ZDOTDIR:-$HOME}/.zprezto"  
git submodule init
git submodule update

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

mkdir "${ZDOTDIR:-$HOME}/source"
git clone https://github.com/kviksilver/prefs.git "${ZDOTDIR:-$HOME}/source/prefs"
cp "${ZDOTDIR:-$HOME}/source/prefs/com.googlecode.iterm2.plist" "${ZDOTDIR:-$HOME}/Library/Preferences"

cp "Midnight.*" "${ZDOTDIR:-$HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes/*"
