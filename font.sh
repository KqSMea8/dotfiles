# powerline
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# nerd font
# https://github.com/ryanoasis/nerd-fonts
# https://github.com/maximbaz/lightline-ale#using-icons-as-indicators
brew tap caskroom/fonts
brew cask install font-hack-nerd-font
