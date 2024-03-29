#!/bin/sh

echo ""
echo ""
echo ""
echo "Instalando PARU "
echo ""
echo ""
echo ""

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd $HOME
clear

echo ""
echo ""
echo ""
echo "Instalando X "
echo ""
echo ""
echo ""

sudo pacman -S --needed xorg xorg-apps xorg-drivers xorg-fonts libx11
clear

echo ""
echo ""
echo ""
echo "Instalando Drivers "
echo ""
echo ""
echo ""
sleep 3

sudo pacman -S --needed xf86-video-fbdev xf86-video-vesa xf86-video-intel xorg-xinput xf86-input-libinput numlockx xf86-video-nouveau nvidia nvidia-utils nvidia-settings
clear
  
echo ""
echo ""  
echo ""
echo "Instalando Window Manager (BSPWM) "
echo ""
echo ""
echo ""

sleep 3
sudo pacman -S --needed bspwm wmname sxhkd xclip
clear

echo ""
echo ""
echo ""
echo "Instalando Pacotes de Rede "
echo ""
echo ""
echo ""

sleep 3
sudo pacman -S --needed inetutils networkmanager networkmanager-openvpn nethogs nm-connection-editor bluez bluez-utils blueman pulseaudio-bluetooth 
clear

echo ""
echo ""
echo ""
echo "Instalando Pacotes de Multimidia "
echo ""
echo ""
echo ""

sleep 3
sudo pacman -S --needed alsa-plugins alsa-tools alsa-utils pavucontrol viewnior gwenview ffmpeg ffmpegthumbnailer mpc mpd mplayer ncmpcpp tumbler feh alsa-card-profiles alsa-card-profiles alsa-plugins alsa-firmware gst-libav gst-plugin-pipewire gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gstreamer gstreamer-vaapi pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber x264 x265 xvidcore
clear

echo ""
echo ""
echo ""
echo "Instalando Pacotes de Arquivos/Terminais/Documentos/Editores/Font Managers "
echo ""
echo ""
echo ""

sleep 3
sudo pacman -S --needed ttf-iosevka-nerd ttf-nerd-fonts-symbols ranger highlight trash-cli ueberzug nemo nemo-preview nemo-seahorse nemo-fileroller zip p7zip unzip unrar xarchiver xdg-user-dirs xdg-user-dirs-gtk alacritty xfce4-terminal atril geany geany-plugins vim neovim kitty noto-fonts noto-fonts-emoji terminus-font ttf-dejavu ttf-cascadia-code
clear

echo ""
echo ""
echo ""
echo "Instalando Pacotes do Sistema "
echo ""
echo ""
echo ""

sleep 3
sudo pacman -S --needed acpi autoconf automake binutils bison calc fakeroot gcc gparted gtk-engine-murrine gvfs gvfs-mtp gvfs-afc gvfs-gphoto2 gvfs-smb gvfs-google inotify-tools jq make patch pkg-config polkit polkit-kde-agent powertop sshfs udisks2 wmctrl xclip xdotool xmlstarlet yad sndio
clear

echo ""
echo ""
echo ""
echo "Instalando Pacotes Utilitários "
echo ""
echo ""
echo ""

sleep 3
sudo pacman -S --needed baobab dialog dunst gpick htop lxappearance meld ncdu nitrogen python-pywal rofi maim slop xsettingsd kvantum qt5ct open-vm-tools
clear

echo ""
echo ""
echo ""
echo "Instalando Pacotes AUR "
echo ""
echo ""
echo ""

sleep 3
paru -S graphite-cursor-theme-git materia-gtk-theme cava nemo-dropbox downgrade ksuperkey light networkmanager-dmenu-git obmenu-generator perl-linux-desktopfiles polybar timeshift tlpui
clear

echo "####################"
echo "#     F E I T O    #"
echo "####################"
