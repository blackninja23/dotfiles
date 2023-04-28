sudo pacman -S playerctl vim polybar variety xorg-xbacklight arandr flameshot feh alsa-utils i3blocks i3status i3 i3-wm lxappearance rofi unclutter cargo papirus-icon-theme imagemagick picom arc-gtk-theme arc-icon-theme gtk-engine-murrine elementary-icon-theme autoconf meson zsh acpi alacritty
sudo pacman -S ranger atool highlight ffmpegthumbnailer w3m transmission-cli lynx neofetch cpio lha lzop unace unrar
mkdir -p ~/.local/share/fonts/

git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd ../..

mkdir -p ~/.config/picom
mkdir -p ~/.config/rofi
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/polybar
cp .config/i3/auto-wall.sh ~/.config/i3/auto-wall.sh
cp .config/i3/clipboard_fix.sh ~/.config/i3/clipboard_fix.sh
cp .config/i3/config_i3 ~/.config/i3/config
cp .config/alacritty/alacritty_i3.yml ~/.config/alacritty/alacritty.yml
cp -r .config/polybar/* ~/.config/polybar/
cp .config/picom/picom.conf ~/.config/picom/picom.conf
cp -r .config/rofi/* ~/.config/rofi/
cp .config/i3/clipboard_fix.sh ~/.config/i3/clipboard_fix.sh
cp -r .wallpaper ~/.wallpaper 
cp .tmux.conf ~/.tmux.conf
cp .vimrc ~/.vimrc

# Touchpad settings
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput keyboard catchall"
        MatchIsKeyboard "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Option "Tapping" "True"
        Option "NaturalScrolling" "True"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput touchscreen catchall"
        MatchIsTouchscreen "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput tablet catchall"
        MatchIsTablet "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection
EOF

echo "Done! Grab some wallpaper and run pywal -i filename to set your color scheme. To have the wallpaper set on every boot edit ~.fehbg"
echo "After reboot: Select i3 on login, run lxappearance and select arc-dark"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
