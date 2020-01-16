#!/bin/bash

# Install curl
sudo apt install curl -y

# Install i3-gaps
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt install i3-gaps-wm -y

# Install i3status-rs
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo 'PATH="/home/william/.cargo/bin:/home/william/.local/bin:$PATH"' >> /home/william/.profile
source /home/william/.profile
cargo install cargo-deb
git clone https://github.com/greshake/i3status-rust
cd i3status-rust 
git checkout cargo-deb
cargo deb
sudo dpkg -i target/debian/i3status-rust_0.12.0_amd64.deb 
cd ..

# Install Hack font
sudo apt install fonts-hack fonts-hack-ttf -y

# Install tilix
sudo apt install tilix -y

# Install tilix theme
git clone https://github.com/arcticicestudio/nord-tilix
cd nord-tilix
bash install.sh 
cd ..

# Download wallpaper
git clone git@github.com:AnubisZ9/Global-Dark-Nordic-theme.git
cd Global-Dark-Nordic-theme
cp Dotfiles/Wallpapers/nordic_dark_wallpaper.png /home/william/Pictures/wallpaper.png 
echo 'feh --bg-fill ~/Pictures/wallpaper.png' >> /home/william/.profile
cd ..

# Set up firefox
cd ~/.mozilla/firefox
cd *.default
mkdir chrome
cp ~/.config/i3/Global-Dark-Nordic-theme/Dotfiles/firefox/Dark_Nordic/* .
echo 'Visit https://www.userchrome.org/how-create-userchrome-css.html to set up firefox profile'
cd ~/.config/i3
