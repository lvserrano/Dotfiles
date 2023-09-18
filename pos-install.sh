#!/bin/bash

echo ""
echo ""
echo ""
echo "SCRIPT DE PÓS INSTALAÇÃO"
echo ""
echo ""
echo ""
sleep 5
clear
source pacotes.sh
clear
echo ""
echo ""
echo ""
echo "INSTALANDO FONTES"
echo ""
echo ""
echo ""
sleep 5
xdg-user-dirs-update
python3 install.py
clear
echo ""
echo ""
echo ""
echo "ARQUIVOS DE CONFIGURAÇÃO DE TECLADO E MOUSEPAD"
echo ""
echo ""
echo ""
sleep 5
sudo mv 00-keyboard.conf 30-touchpad.conf /etc/X11/xorg.conf.d/
echo ""
echo ""
echo ""
echo "ATIVANDO SERVIÇOS"
echo ""
echo ""
echo ""
sleep 5
sudo systemctl enable NetworkManager
sudo sed -i 's|#AutoEnable=false|AutoEnable=true|g' /etc/bluetooth/main.conf
sudo systemctl enable bluetooth
sudo systemctl enable cups.service
sudo systemctl enable sshd
sudo systemctl enable avahi-daemon
sudo systemctl enable tlp
sudo systemctl enable reflector.timer
sudo systemctl enable fstrim.timer
sudo systemctl enable acpid
sudo ntpd -qg
sudo systemctl enable ntpd.service
clear
echo ""
echo ""
echo ""
echo "REFLECTOR"
echo ""
echo ""
echo ""
sleep 5
sudo reflector --latest 50 -a 6 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
clear
echo ""
echo ""
echo ""
echo "CONFIGURANDO COMPILADOR PARA USAR TODOS OS NÚCLEOS NA COMPILAÇÃO"
echo ""
echo ""
echo ""
sleep 5
sudo sed -i -e 's|[#]*MAKEFLAGS=.*|MAKEFLAGS="-j$(nproc)"|g' /etc/makepkg.conf
sudo sed -i -e 's|[#]*COMPRESSXZ=.*|COMPRESSXZ=(xz -c -T 8 -z -)|g' /etc/makepkg.conf
echo ""
echo ""
echo ""
echo "PRÓXIMOS PASSOS:"
echo "0 - CONFIGURAR 2 MONITORES"
echo "1 - PAPEL DE PAREDE"
echo "2 - HABILITAR POLKIT BSPWMRC"
echo "3 - INSTALAR ZSH, OH-MY-ZSH, POWERLEVEL 10K, zsh-autosuggestions, zsh-completions, zsh-history-substring-search, zsh-syntax-highlighting, chsh -s /usr/bin/zsh"
echo "4 - CONFIGURAR HIBERNAÇÃO"
echo "5 - CONFIGURAR TIMESHIFT"
echo "6 - CONFIGURAR ZRAM"
echo "7 - CONFIGURAR PRELOAD"
echo "8 - INSTALAR E CONFIGURAR LUNARVIM"
echo ""
echo ""
echo ""
sleep 30
