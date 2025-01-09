#!/bin/sh

PLASMA_PACKAGES=(
    bluedevil
    breeze
    breeze-gtk
    breeze-plymouth
    discover
    drkonqi
    flatpak-kcm
    kactivitymanagerd
    kde-cli-tools
    kde-gtk-config
    kdecoration
    kdeplasma-addons
    kgamma
    kinfocenter
    kmenuedit
    kpipewire
    kscreen
    kscreenlocker
    ksshaskpass
    ksystemstats
    kwallet-pam
    kwayland-integration
    kwin
    kwrited
    layer-shell-qt
    libkscreen
    libksysguard
    milou
    plasma-browser-integration
    plasma-desktop
    plasma-disks
    plasma-firewall
    plasma-integration
    plasma-nm
    plasma-pa
    plasma-systemmonitor
    plasma-thunderbolt
    plasma-vault
    plasma-workspace
    plasma-workspace-wallpapers
    plymouth-kcm
    polkit-kde-agent
    powerdevil
    sddm
    sddm-kcm
    systemsettings
    system-config-printer
    xdg-desktop-portal-kde
    plasma-wayland-protocols
    dolphin
    ark
    kcalc
    kate
    kdeconnect
    gwenview
    haruna
    okular
    spectacle
    konsole
    packagekit-qt5
    print-manager
    skanpage
    qt5-imageformats
    kwalletmanager
    partitionmanager
    ffmpegthumbs
    ffmpegthumbnailer
    merkuro
    krfb
    kio-gdrive
    kdepim-addons
)

PLASMA_CONFIGS=(
    ~/.cache/
    ~/.config/akonadi
    ~/.config/fontconfig/
    ~/.config/gtk-3.0
    ~/.config/gtk-4.0
    ~/.config/kate
    ~/.config/KDE
    ~/.config/kde.org
    ~/.config/kdeconnect
    ~/.config/kdedefaults
    ~/.config/libaccounts-glib
    ~/.config/menus
    ~/.config/plasma-workspace
    ~/.config/pulse
    ~/.config/session
    ~/.config/signond
    ~/.config/xsettingsd
    ~/.config/*rc
    ~/.config/kwritemetainfos
    ~/.config/gtkrc-2.0
    ~/.config/katemetainfos
    ~/.config/kdeglobals
    ~/.config/konsolesshconfig
    ~/.config/PlasmaDiscoverUpdates
    ~/.config/print-manager
    ~/.config/mimeapps.list
    ~/.config/kwinoutputconfig.json
    ~/.config/QtProject.conf
    ~/.config/Trolltech.conf
    ~/.local/share/apps
    ~/.local/share/akonadi
    ~/.local/share/ark
    ~/.local/share/dolphin
    ~/.local/share/kded5
    ~/.local/share/kwalletd
    ~/.local/share/kwrite
    ~/.local/share/kpeople
    ~/.local/share/gwenview
    ~/.local/share/kactivitymanagerd
    ~/.local/share/kate
    ~/.local/share/kcookiejar
    ~/.local/share/KDE
    ~/.local/share/kded6
    ~/.local/share/klipper
    ~/.local/share/knewstuff3
    ~/.local/share/konsole
    ~/.local/share/kpeoplevcard
    ~/.local/share/kscreen
    ~/.local/share/kwalletd
    ~/.local/share/libkunitconversion
    ~/.local/share/okular
    ~/.local/share/plasma-systemmonitor
    ~/.local/share/remoteview
    ~/.local/share/sddm
    ~/.local/share/user-places.xbel
    ~/.local/share/user-places.xbel.bak
    ~/.local/share/user-places.xbel.tbcache
    ~/.local/share/krunnerstaterc
    ~/.local/share/recently-used.xbel
    ~/.gtkrc-2.0
)

GNOME_PACKAGES=(
    adw-gtk-theme
    evince
    gdm
    geary
    gnome-backgrounds
    gnome-calendar
    gnome-characters
    gnome-color-manager
    gnome-console
    gnome-control-center
    gnome-disk-utility
    gnome-keyring
    gnome-menus
    gnome-session
    gnome-settings-daemon
    gnome-shell
    gnome-system-monitor
    gnome-user-share
    grilo-plugins
    gvfs
    gvfs-afc
    gvfs-goa
    gvfs-google
    gvfs-gphoto2
    gvfs-mtp
    gvfs-nfs
    gvfs-smb
    malcontent
    nautilus
    orca
    rygel
    sushi
    tecla
    xdg-desktop-portal-gnome
    xdg-user-dirs-gtk
    gnome-tweaks
    gnome-themes-extra
    gnome-browser-connector
)

GNOME_FLATPAKS=(
    de.haeckerfelix.Fragments
    io.github.celluloid_player.Celluloid
    org.bluesabre.MenuLibre
    org.gnome.Calculator
    org.gnome.SimpleScan
    org.gnome.font-viewer
    org.gnome.TextEditor
    org.gnome.Loupe
    org.gnome.Extensions
    org.gnome.NetworkDisplays
    org.gnome.FileRoller
)

GNOME_CONFIGS=(
    ~/.cache/
    ~/.config/celluloid
    ~/.config/chromium
    ~/.config/dconf
    ~/.config/evince
    ~/.config/evolution
    ~/.config/gnome-control-center
    ~/.config/gnome-session
    ~/.config/goa-1.0
    ~/.config/google-chrome
    ~/.config/google-chrome-beta
    ~/.config/google-chrome-unstable
    ~/.config/gsconnect
    ~/.config/gtk-3.0
    ~/.config/gtk-4.0
    ~/.config/Kvantum
    ~/.config/menus
    ~/.config/microsoft-edge-beta
    ~/.config/microsoft-edge-dev
    ~/.config/nautilus
    ~/.config/simple-scan
    ~/.config/.gsd-keyboard.settings-ported
    ~/.gnome
    ~/.local/share/applications/
    ~/.local/share/backgrounds
    ~/.local/share/baloo
    ~/.local/share/desktop-directories
    ~/.local/share/evolution
    ~/.local/share/gnome-control-center-goa-helper
    ~/.local/share/gnome-settings-daemon
    ~/.local/share/gnome-shell
    ~/.local/share/gvfs-metadata
    ~/.local/share/keyrings
    ~/.local/share/nautilus
    ~/.local/share/nautilus-python
    ~/.local/share/nemo-python
    ~/.local/share/org.gnome.TextEditor
)

read -p $'ESCOLHA O DESKTOP A SER INSTALADO\n1) Gnome\n2) Plasma\nInstalar: ' DESKTOP
DESKTOP="${DESKTOP:-"0"}"

if [ $DESKTOP = "1" ]; then
    clear

    echo "Instalando Gnome" && sleep 3

    clear

    sudo pacman -Syu "${GNOME_PACKAGES[@]}" --noconfirm
    flatpak install "${GNOME_FLATPAKS[@]}" -y
    curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash

    echo "Aplicando configurações..." && sleep 1
    echo "- Ordenação de arquivos" ; gsettings set org.gnome.nautilus.preferences default-sort-order 'type'
    echo "- Tema da interface" ; gsettings set org.gnome.desktop.interface gtk-theme Adw-dark
    echo "- Tema de ícones" ; gsettings set org.gnome.desktop.interface icon-theme Adwaita
    echo "- Tema do cursor" ; gsettings set org.gnome.desktop.interface cursor-theme Adwaita
    echo "- Botões de janela" ; gsettings set org.gnome.desktop.wm.preferences button-layout ':close'
    echo "- Centralização de janelas" ; gsettings set org.gnome.mutter center-new-windows 'true'
    echo "- Touchpad em TtoC" ; gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'
    echo "- Serviços de localização" ; gsettings set org.gnome.system.location enabled 'true'
    echo "- Exclusão de arquivos" ; gsettings set org.gnome.desktop.privacy remove-old-temp-files 'true' && gsettings set org.gnome.desktop.privacy remove-old-trash-files 'true'
    echo "- Suspensão automática" ; gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 1800 && gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 900
    echo "- Data na barra de tarefas" ; gsettings set org.gnome.desktop.interface clock-show-date 'false'

    clear 

    echo "Atualizando DM" && sleep 3

    if pacman -Qs sddm > /dev/null ; then
        sudo systemctl disable sddm && sudo systemctl enable gdm && sleep 1 && clear

        read -p $'Remover o outro DE? (s/N): ' CLEAN
        CLEAN="${CLEAN:-"N"}"
        if [ ${CLEAN^^} = "S" ]; then           
            clear
            echo "Removendo Plasma" && sleep 3 && clear
            sudo pacman -Rcsn "${PLASMA_PACKAGES[@]}" --noconfirm && clear

            echo "Removendo dotfiles" && sleep 3
            for files in "${PLASMA_CONFIGS[@]}"; do
                rm -rf "$files"
            done
            clear
        fi
    else
        sudo systemctl enable gdm && sleep 1 && clear

    fi
    echo "Limpando PACMAN..." && sleep 3 && clear

    yay -Yc --noconfirm ; yay -Sc --noconfirm ; clear

    read -p $'Reiniciar o sistema? (s/N): ' REBOOT
    REBOOT="${REBOOT:-"N"}"
    if [ ${REBOOT^^} = "S" ]; then
        echo "Reiniciando..." && sleep 3
        reboot
    else
        echo "Encerrando script de instalação..."
    fi

elif [ $DESKTOP = "2" ]; then
    clear

    echo "Instalando Plasma" && sleep 3 && clear

    sudo pacman -Syu "${PLASMA_PACKAGES[@]}" --noconfirm
    mkdir /home/marshall/.config/fontconfig/ && wget https://raw.githubusercontent.com/GaKu999/dotfiles/main/.config/fontconfig/fonts.conf -O ~/.config/fontconfig/fonts.conf
    clear

    if pacman -Qs gdm > /dev/null ; then
        sudo systemctl disable gdm && sudo systemctl enable sddm && sleep 1 && clear

        read -p $'Remover o outro DE? (s/N): ' CLEAN
        CLEAN="${CLEAN:-"N"}"
        if [ ${CLEAN^^} = "S" ]; then           
            clear
            echo "Removendo Gnome" && sleep 3 && clear
            yay -Rsn menulibre --noconfirm
            sudo pacman -Rcsn "${GNOME_PACKAGES[@]}" --noconfirm && clear
            flatpak uninstall "${GNOME_FLATPAKS[@]}" -y

            echo "Removendo dotfiles" && sleep 3
            for files in "${GNOME_CONFIGS[@]}"; do
                rm -rf "$files"
            done
            clear
        fi
    else
        sudo systemctl enable sddm && sleep 1 && clear

    fi
    echo "Limpando PACMAN..." && sleep 3 && clear

    yay -Yc --noconfirm ; yay -Sc --noconfirm ; clear

    read -p $'Reiniciar o sistema? (s/N): ' REBOOT
    REBOOT="${REBOOT:-"N"}"
    if [ ${REBOOT^^} = "S" ]; then
        echo "Reiniciando..." && sleep 3
        reboot
    else
        echo "Encerrando script de instalação..."
    fi
else
    echo 'Opção inválida'
fi
