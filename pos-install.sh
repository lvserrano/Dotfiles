#!/usr/bin/env bash
#-------------------------------------------------------------------------
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------
echo
echo "INSTALANDO paru"
echo

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd $HOME
clear

echo
echo "INSTALANDO SOFTWARES"
echo

PKGS=(
    # SYSTEM --------------------------------------------------------------
    'linux-lts'             # Long term support kernel
    # TERMINAL UTILITIES --------------------------------------------------
    'xorg'                  # Servidor Xorg - fornece a infraestrutura para sistemas gráficos no Linux
    'xorg-apps'             # Aplicações e utilitários do Xorg
    'xorg-drivers'          # Drivers para placas gráficas e dispositivos de entrada no Xorg
    'xorg-fonts'            # Conjunto de fontes para o Xorg
    'xorg-xinit'            # Conjunto inicializador para o servidor Xorg
    'libx11'                # Biblioteca básica para o sistema X Window, que fornece funcionalidades essenciais
    'bash-completion'       # Completar com Tab no Bash
    'bc'                    # Linguagem de calculadora de precisão
    'bleachbit'             # Utilitário de exclusão de arquivos
    'curl'                  # Recuperação de conteúdo remoto
    'elinks'                # Navegador web baseado em terminal
    'feh'                   # Visualizador/manipulador de imagens baseado em terminal
    'file-roller'           # Utilitário de arquivamento
    'gnome-keyring'         # Armazenamento de senhas do sistema
    'gtop'                  # Monitoramento do sistema via terminal
    'gufw'                  # Gerenciador de firewall
    'hardinfo'              # Aplicativo de informações de hardware
    'htop'                  # Visualizador de processos
    'inxi'                  # Utilitário de informações do sistema
    'jq'                    # Biblioteca de análise de JSON
    'jshon'                 # Biblioteca de análise de JSON
    'neofetch'              # Mostra informações do sistema ao iniciar o terminal
    'ntp'                   # Protocolo de Tempo de Rede para configurar o horário via rede.
    'numlockx'              # Ativa o Num Lock no X11
    'openssh'               # Ferramentas de conectividade SSH
    'rsync'                 # Utilitário de sincronização remota de arquivos
    'speedtest-cli'         # Velocidade da Internet via terminal
    'terminus-font'         # Pacote de fontes com algumas fontes maiores para o terminal de login
    'tlp'                   # Gerenciamento avançado de energia para laptops
    'unrar'                 # Programa de compressão RAR
    'unzip'                 # Programa de compressão Zip
    'wget'                  # Recuperação de conteúdo remoto
    'xfce4-terminal'        # Emulador de terminal
    'zenity'                # Exibe caixas de diálogo gráficas via scripts shell
    'zip'                   # Programa de compressão Zip
    'zsh'                   # Shell ZSH
    'zsh-completions'       # Completar com Tab para ZSH
    'bzip2'                 # Programa de compressão Bzip2 - compacta arquivos usando o algoritmo Burrows-Wheeler
    'gzip'                  # Programa de compressão Gzip - compacta arquivos usando o algoritmo DEFLATE
    'lrzip'                 # Programa de compressão LRZIP - utiliza compressão LZMA para alcançar altas taxas de compressão
    'lz4'                   # Programa de compressão LZ4 - oferece compressão rápida e descompressão ultra rápida
    'lzip'                  # Programa de compressão Lzip - utiliza o algoritmo LZMA para compressão
    'lzop'                  # Programa de compressão LZOP - compacta arquivos usando o algoritmo LZO
    'xz'                    # Programa de compressão XZ - utiliza o algoritmo LZMA2 para compressão
    'zstd'                  # Programa de compressão Zstandard - oferece altas taxas de compressão e velocidade
    # DRIVERS ------------------------------------------------------
    'xf86-video-fbdev'       # Driver de vídeo genérico para aceleração 2D usando o framebuffer do kernel
    'xf86-video-vesa'        # Driver de vídeo VESA - suporta muitos adaptadores gráficos básicos
    'xf86-video-intel'       # Driver de vídeo Intel para placas gráficas Intel
    'xorg-xinput'            # Utilitário para configurar e testar dispositivos de entrada no Xorg
    'xf86-input-libinput'    # Driver de entrada para o Xorg que utiliza a biblioteca libinput
    'numlockx'               # Ativa o Num Lock no X11 durante a inicialização
    'nvidia'                 # Driver da NVIDIA para placas gráficas NVIDIA
    'nvidia-utils'           # Utilitários relacionados ao driver da NVIDIA
    'nvidia-settings'        # Ferramenta de configuração para placas gráficas NVIDIA
    'xorg-server-devel'      # Desenvolvimento do servidor Xorg - cabeçalhos e arquivos de desenvolvimento
    'opencl-nvidia'          # Implementação OpenCL da NVIDIA
    # BSPWM ------------------------------------------------------
    'bspwm'      # Gerenciador de janelas binário para X11, minimalista e altamente personalizável
    'wmname'     # Define o nome do gerenciador de janelas X11 que está sendo executado
    'sxhkd'      # Gerenciador de hotkeys (teclas de atalho) para X11, usado frequentemente com o bspwm
    'xclip'      # Ferramenta de linha de comando para manipulação de área de transferência X11
    # REDES ------------------------------------------------------
    'inetutils'                # Conjunto de utilitários básicos de rede para o GNU
    'networkmanager'           # Gerenciador de conexões de rede para Linux
    'networkmanager-openvpn'   # Plugin OpenVPN para NetworkManager
    'nethogs'                  # Ferramenta de monitoramento de uso de largura de banda por processo
    'nm-connection-editor'     # Editor de conexões para NetworkManager
    'bluez'                    # Pilha de protocolos Bluetooth para Linux
    'bluez-utils'              # Utilitários relacionados ao Bluetooth para Linux
    'blueman'                  # GUI para gerenciamento de dispositivos Bluetooth
    'bluez-firmware'        # Firmwares for Broadcom BCM203x and STLC2300 Bluetooth chips
    'blueberry'             # Bluetooth configuration tool
    'pulseaudio-bluetooth'     # Módulo Bluetooth para o servidor de som PulseAudio
    # MULTIMIDIA ------------------------------------------------------
    'alsa-plugins'               # Plugins adicionais para o Advanced Linux Sound Architecture (ALSA)
    'alsa-tools'                 # Ferramentas adicionais para o ALSA
    'alsa-utils'                 # Utilitários do ALSA (Advanced Linux Sound Architecture)
    'pavucontrol'                # Controle gráfico para o PulseAudio
    'viewnior'                   # Visualizador de imagens leve
    'gwenview'                   # Visualizador de imagens para o ambiente de desktop KDE
    'ffmpeg'                     # Ferramenta de conversão e manipulação de multimídia
    'ffmpegthumbnailer'          # Gera miniaturas de vídeo usando o FFmpeg
    'mpc'                        # Cliente de linha de comando para o Music Player Daemon (MPD)
    'mpd'                        # Music Player Daemon - servidor de música
    'mplayer'                    # Reprodutor de vídeo
    'ncmpcpp'                    # Interface cliente para o MPD (Music Player Daemon)
    'tumbler'                    # Serviço D-Bus para gerar miniaturas de arquivos
    'feh'                        # Visualizador de imagens leve e rápido
    'alsa-card-profiles'         # Perfis de cartão ALSA para diferentes dispositivos de áudio
    'alsa-firmware'              # Firmware para dispositivos de áudio suportados pelo ALSA
    'gst-libav'                  # Plugin GStreamer para integração com a biblioteca libav (FFmpeg)
    'gst-plugin-pipewire'        # Plugin GStreamer para integração com o PipeWire
    'gst-plugins-base'           # Plugin GStreamer com elementos básicos
    'gst-plugins-good'           # Plugin GStreamer com elementos de boa qualidade
    'gst-plugins-bad'            # Plugin GStreamer com elementos de qualidade questionável
    'gst-plugins-ugly'           # Plugin GStreamer com elementos potencialmente problemáticos
    'gstreamer'                  # Estrutura de desenvolvimento multimídia
    'gstreamer-vaapi'            # Plugin GStreamer para aceleração de vídeo VA-API
    'pipewire'                   # Servidor de áudio e vídeo de próxima geração
    'pipewire-alsa'              # Plugin ALSA para o PipeWire
    'pipewire-jack'              # Plugin JACK para o PipeWire
    'pipewire-pulse'             # Plugin PulseAudio para o PipeWire
    'wireplumber'                # Gerenciador de sessões de áudio para o PipeWire
    'x264'                       # Biblioteca para codificação de vídeo H.264
    'x265'                       # Biblioteca para codificação de vídeo H.265 (HEVC)
    'xvidcore'                   # Biblioteca para codificação de vídeo Xvid
    # Instalando Pacotes de Arquivos/Terminais/Documentos/Editores/Font Managers  ------------------------------------------------------
    'ttf-iosevka-nerd'           # Fonte Iosevka com ícones Nerd Font
    'ttf-nerd-fonts-symbols'     # Conjunto de fontes com ícones e glifos adicionais
    'ranger'                     # Gerenciador de arquivos em modo texto com visualização de pré-visualização
    'highlight'                  # Ferramenta para realçar a sintaxe de código fonte
    'trash-cli'                  # Ferramenta de linha de comando para enviar arquivos para a lixeira
    'ueberzug'                   # Ferramenta para exibir imagens no terminal
    'nemo'                       # Gerenciador de arquivos para o ambiente de desktop Cinnamon
    'nemo-preview'               # Plugin de pré-visualização para o Nemo
    'nemo-seahorse'              # Integração do Seahorse para o Nemo (gerenciador de chaves)
    'nemo-fileroller'            # Plugin de compactação e descompactação para o Nemo
    'zip'                        # Programa de compressão Zip
    'p7zip'                      # Implementação de 7z para o Linux
    'unzip'                      # Programa de descompactação Zip
    'unrar'                      # Programa de descompactação RAR
    'xarchiver'                  # Gerenciador de arquivos comprimidos para o ambiente de desktop Xfce
    'xdg-user-dirs'              # Utilitário para gerenciar diretórios pessoais do usuário
    'xdg-user-dirs-gtk'          # Integração GTK para o xdg-user-dirs
    'alacritty'                  # Emulador de terminal rápido e leve
    'xfce4-terminal'             # Emulador de terminal para o ambiente de desktop Xfce
    'atril'                      # Visualizador de documentos para o ambiente de desktop MATE
    'geany'                      # Editor de texto leve com recursos de IDE
    'geany-plugins'              # Plugins adicionais para o Geany
    'vim'                        # Editor de texto avançado
    'neovim'                     # Editor de texto avançado - versão melhorada do Vim
    'kitty'                      # Emulador de terminal GPU-acelerado
    'noto-fonts'                 # Família de fontes Noto da Google
    'noto-fonts-emoji'           # Conjunto de fontes Noto com suporte a emojis
    'terminus-font'              # Pacote de fontes com algumas fontes maiores para o terminal
    'ttf-dejavu'                 # Família de fontes DejaVu
    'ttf-cascadia-code'          # Família de fontes Cascadia Code
    'nerd-fonts'                 # Conjunto de fontes com ícones e glifos adicionais
    # PACOTES DO SITEMA ------------------------------------------------------
    'sddm'
    'kde-applications-meta'
    'flatpak'
    'plasma'
    'fwupd'
    'packagekit-qt5'
    'acpi'                   # Utilitário para mostrar informações sobre dispositivos ACPI
    'autoconf'               # Ferramenta de configuração automática de software
    'automake'               # Ferramenta para geração automática de Makefiles
    'binutils'               # Conjunto de ferramentas para manipulação de binários
    'bison'                  # Gerador de analisadores sintáticos
    'calc'                   # Calculadora de linha de comando
    'fakeroot'               # Ferramenta que fornece um ambiente falso root para compilação
    'gcc'                    # Compilador GNU C
    'gparted'                # Utilitário de particionamento de disco gráfico
    'gtk-engine-murrine'     # Motor de tema GTK para o mecanismo Murrine
    'gvfs'                   # Sistema virtual de arquivos para o ambiente de desktop GNOME
    'gvfs-mtp'               # Suporte MTP para o GVFS
    'gvfs-afc'               # Suporte AFC para o GVFS
    'gvfs-gphoto2'           # Suporte GPhoto2 para o GVFS
    'gvfs-smb'               # Suporte SMB para o GVFS
    'gvfs-google'            # Suporte Google para o GVFS
    'inotify-tools'          # Ferramentas para monitoramento de eventos do sistema de arquivos
    'jq'                     # Processador de JSON leve e flexível
    'make'                   # Ferramenta para automatizar compilações de programas
    'patch'                  # Aplicador de patches para arquivos de texto
    'pkg-config'             # Utilitário para obter informações sobre bibliotecas instaladas
    'polkit'                 # Framework de autorização do sistema
    'polkit-kde-agent'       # Agente PolKit para o ambiente de desktop KDE
    'powertop'               # Ferramenta de análise de consumo de energia
    'sshfs'                  # Sistema de arquivos que usa o SSH para montar um diretório remotamente
    'udisks2'                # Daemon de gerenciamento de discos
    'wmctrl'                 # Utilitário de linha de comando para interagir com gerenciadores de janelas EWMH
    'xclip'                  # Utilitário para manipulação de área de transferência X11
    'xdotool'                # Ferramenta de automação de interações com a GUI X11
    'xmlstarlet'             # Ferramenta para processamento de XML
    'yad'                    # Criação de diálogos gráficos para scripts shell
    'sndio'                  # Protocolo de áudio simples
    # UTILIDADES ------------------------------------------------------
    'autofs'              # Serviço de automontagem que monta automaticamente sistemas de arquivos quando são acessados
    'exfat-utils'         # Utilitários para trabalhar com sistemas de arquivos exFAT
    'gparted'             # Utilitário gráfico para particionamento de discos
    'gnome-disks'         # Utilitário de disco para o ambiente de desktop GNOME
    'ntfs-3g'             # Implementação de código aberto do sistema de arquivos NTFS
    'parted'              # Utilitário de linha de comando para particionamento de discos
    'baobab'             # Analisador gráfico de uso de disco
    'dialog'             # Construtor de caixas de diálogo para scripts shell
    'dunst'              # Notificador de eventos de baixa latência para o ambiente de desktop X11
    'gpick'              # Seletor de cores avançado
    'htop'               # Visualizador interativo de processos
    'lxappearance'       # Ferramenta para personalizar o visual do ambiente de desktop LXDE
    'meld'               # Ferramenta de comparação e mesclagem de arquivos e diretórios
    'ncdu'               # Visualizador de uso de disco no terminal
    'nitrogen'           # Configurador de plano de fundo do desktop
    'python-pywal'       # Ferramenta de paleta e gerador de plano de fundo
    'rofi'               # Seletor de aplicativos e lançador de janelas
    'maim'               # Ferramenta de captura de tela
    'slop'               # Seleção de região de tela
    'xsettingsd'         # Daemon para aplicar configurações de X Settings
    'kvantum'            # Tema de widget do Qt para KDE
    'qt5ct'              # Configuração do Qt5 para ambientes não-KDE
    'open-vm-tools'      # Ferramentas para máquinas virtuais VMware
    'picom'              # Compositor leve para o X11, adicionando efeitos visuais como sombras e transparência.
    'cups'                    # Drivers de impressora de código aberto
    'cups-pdf'                # Suporte PDF para o CUPS
    'ghostscript'             # Interpretador de PostScript
    'gsfonts'                 # Fontes de substituição para Adobe Postscript
    'hplip'                   # Drivers HP
    'system-config-printer'   # Utilitário de configuração de impressora

    # GENERAL UTILITIES ---------------------------------------------------
    'catfish'           # Ferramenta de busca no sistema de arquivos
    'veracrypt'         # Utilitário de criptografia de disco
    'xfburn'            # Aplicativo de gravação de CD
    # DEVELOPMENT ---------------------------------------------------------
    'apache'             # Servidor web Apache
    'clang'              # Compilador C Lang
    'cmake'              # Sistema de construção de código aberto e multiplataforma
    'electron'           # Desenvolvimento multiplataforma usando JavaScript
    'git'                # Sistema de controle de versão
    'gcc'                # Compilador C/C++
    'glibc'              # Bibliotecas C
    'mariadb'            # Substituto drop-in para o MySQL
    'meld'               # Comparação de arquivos/diretórios
    'nodejs'             # Ambiente de execução para JavaScript
    'npm'                # Gerenciador de pacotes para Node.js
    'php'                # Linguagem de script para aplicações web
    'php-apache'         # Driver Apache PHP
    'postfix'            # Servidor de e-mail SMTP
    'python'             # Linguagem de script Python
    'qtcreator'          # IDE C++ multiplataforma Qt
    'qt5-examples'       # Demonstrativos de projetos para Qt
    'yarn'               # Gerenciador de dependências (necessário para Hyper)
    'python-pip'         # Gerenciador de pacotes Python
    # WEB TOOLS -----------------------------------------------------------
    'chromium'      # Navegador da web Chromium
    'firefox'       # Navegador da web Firefox
    'filezilla'     # Cliente FTP
    # COMMUNICATIONS ------------------------------------------------------
    'hexchat'     # Cliente de chat multiplataforma
    'irssi'       # Cliente IRC baseado em terminal
    # MEDIA ---------------------------------------------------------------
    'lollypop'              # Reprodutor de música
    'simplescreenrecorder'  # Gravador de tela
    'vlc'                   # Reprodutor de vídeo
    'obs-studio'            # Open Broadcaster Software Studio - Software de transmissão ao vivo e gravação de tela
    # GRAPHICS AND DESIGN -------------------------------------------------
    'gcolor2'       # Seletor de cores
    'gimp'          # GNU Image Manipulation Program - Programa de Manipulação de Imagens GNU
    'inkscape'      # Aplicativo para criação de imagens vetoriais
    'imagemagick'   # Ferramenta de manipulação de imagens na linha de comando
    'nomacs'        # Visualizador de imagens
    'pngcrush'      # Ferramentas para otimizar imagens PNG
    'ristretto'     # Visualizador de imagens
    # PRODUCTIVITY --------------------------------------------------------
    'galculator'            # Gnome calculator
    'libreoffice-fresh'     # Libre office with extra features
    'xpdf'                  # PDF viewer
    # VIRTUALIZATION ------------------------------------------------------
    'virtualbox'
    'virtualbox-host-modules-arch'
)

for PKG in "${PKGS[@]}"; do
    echo "instalando...: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

CMDN=(
    'graphite-cursor-theme-git'    # Tema de cursor Graphite (versão do Git)
    'materia-gtk-theme'            # Tema GTK Materia
    'cava'                         # Visualizador de áudio em linha de comando
    'nemo-dropbox'                 # Integração do Dropbox para o gerenciador de arquivos Nemo
    'downgrade'                    # Ferramenta para baixar versões específicas de pacotes Arch Linux
    'ksuperkey'                    # Configuração de teclas de atalho para abrir o menu KRunner
    'light'                        # Gerenciador de brilho de tela
    'networkmanager-dmenu-git'     # Menu dmenu para NetworkManager
    'perl-linux-desktopfiles'      # Manipulação de arquivos de desktop Linux em Perl
    'polybar'                      # Barra de status para ambientes de desktop X11
    'timeshift'                    # Ferramenta de backup e restauração do sistema
    'tlpui'                        # Interface gráfica para o TLP (Linux Advanced Power Management)
    'gtkhash'                      # Verificador de checksum
    'dropbox'                      # Armazenamento de arquivos na nuvem
    'keepassxc'                    # Gerenciador de senhas de código aberto
    'spotify'                      # Reprodutor de música
    'screenkey'                    # Gravação de tela exibindo pressionamentos de tecla
    'gtk-theme-arc-git'            # Tema GTK Arc (versão do Git)
    'adapta-gtk-theme-git'         # Tema GTK Adapta (versão do Git)
    'paper-icon-theme'             # Conjunto de ícones Paper
    'tango-icon-theme'             # Conjunto de ícones Tango
    'tango-icon-theme-extras'      # Ícones extras para o conjunto de ícones Tango
    'numix-icon-theme-git'         # Conjunto de ícones Numix (versão do Git)
    'sardi-icons'                  # Conjunto de ícones Sardi

)


for CMDN in "${CMDNS[@]}"; do
    echo "instalando...: ${CMDN}"
    paru -S "$CMDN" --noconfirm
done

echo
echo "PACOTES INSTALADOS... INICIANDO CONFIGURAÇÕES"
echo
sudo systemctl enable NetworkManager
sudo sed -i '/^#AutoEnable=false/s/^#//' /etc/bluetooth/main.conf
sudo sed -i 's/AutoEnable=false/AutoEnable=true/' /etc/bluetooth/main.conf
sudo systemctl enable bluetooth
sudo systemctl enable sshd
sudo systemctl enable sddm.service
sudo systemctl enable avahi-daemon
sudo systemctl enable tlp
sudo systemctl enable fstrim.timer
sudo systemctl enable org.cups.cupsd.service
sudo systemctl enable ntpd.service
sudo ntpd -qg
sudo reflector --verbose --country Brazil --country Argentina --age 12 --protocol https --protocol http --sort rate --save /etc/pacman.d/mirrorlist
sudo sed -i -e 's|[#]*MAKEFLAGS=.*|MAKEFLAGS="-j$(nproc)"|g' /etc/makepkg.conf
sudo sed -i -e 's|[#]*COMPRESSXZ=.*|COMPRESSXZ=(xz -c -T 8 -z -)|g' /etc/makepkg.conf
echo
echo "FEITO!"
echo "mv ./30-touchpad.conf /etc/X11/xorg.conf.d/"
echo "mv ./00-keyboard.conf /etc/X11/xorg.conf.d/"
echo
