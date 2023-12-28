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
    khotkeys
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
    plymouth-kcm
    polkit-kde-agent
    powerdevil
    sddm
    sddm-kcm
    systemsettings
    xdg-desktop-portal-kde
    plasma-wayland-session
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
    qt5-imageformats
    kwalletmanager
    transmission-qt
    merkuro
    kdepim-addons
    kio-gdrive
    partitionmanager
    ffmpegthumbs
    ffmpegthumbnailer
)

GNOME_PACKAGES=(
    evince
    gdm
    gnome-backgrounds
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-color-manager
    gnome-console
    gnome-control-center
    gnome-disk-utility
    gnome-font-viewer
    gnome-keyring
    gnome-menus
    gnome-session
    gnome-settings-daemon
    gnome-shell
    gnome-shell-extensions
    gnome-system-monitor
    gnome-text-editor
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
    loupe
    malcontent
    nautilus
    orca
    rygel
    sushi
    tecla
    tracker3-miners
    xdg-desktop-portal-gnome
    xdg-user-dirs-gtk
    gnome-tweaks
    gnome-themes-extra
    gnome-browser-connector
    kvantum
    celluloid
    fragments
    file-roller
    python-nautilus
)

read -p $'ESCOLHA O DESKTOP A SER INSTALADO\n1) Gnome\n2) Plasma\nInstalar: ' DESKTOP
DESKTOP="${DESKTOP:-"0"}"

if [ $DESKTOP = "1" ]; then
    clear

    echo "Instalando Gnome" && sleep 3

    clear

    sudo pacman -Syu "${GNOME_PACKAGES[@]}" --noconfirm
    yay -Syu adw-gtk-theme menulibre --noconfirm
    curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash
    mkdir ~/.config/Kvantum && git clone https://github.com/GabePoel/KvLibadwaita.git && cd KvLibadwaita/src/ && cp -r KvLibadwaita ~/.config/Kvantum && cd ~ && kvantummanager --set KvLibadwaitaDark && rm -rf KvLibadwaita

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
            sudo pacman -Rsn "${PLASMA_PACKAGES[@]}" --noconfirm

            clear

            echo "Removendo dotfiles" && sleep 3 && clear

            rm -rf /home/marshall/.cache/ /home/marshall/.config/akonadi /home/marshall/.config/fontconfig/ /home/marshall/.config/gtk-3.0 /home/marshall/.config/gtk-4.0 /home/marshall/.config/kate /home/marshall/.config/KDE /home/marshall/.config/kde.org /home/marshall/.config/kdeconnect /home/marshall/.config/kdedefaults /home/marshall/.config/libaccounts-glib /home/marshall/.config/menus /home/marshall/.config/plasma-workspace /home/marshall/.config/pulse /home/marshall/.config/session /home/marshall/.config/signond /home/marshall/.config/xsettingsd /home/marshall/.config/transmission /home/marshall/.config/konsolerc /home/marshall/.config/okularrc /home/marshall/.config/akonadi_akonotes_resource_0rc /home/marshall/.config/akonadi_contacts_resource_0rc /home/marshall/.config/akonadi_google_resource_0rc /home/marshall/.config/akonadi_ical_resource_0rc /home/marshall/.config/akonadi_indexing_agentrc /home/marshall/.config/akonadi_maildir_resource_0rc /home/marshall/.config/akonadi-firstrunrc /home/marshall/.config/akregatorrc /home/marshall/.config/kwritemetainfos /home/marshall/.config/kwriterc /home/marshall/.config/akregatorrc /home/marshall/.config/baloofilerc /home/marshall/.config/bluedevilglobalrc /home/marshall/.config/defaultcalendarrc /home/marshall/.config/discoverrc /home/marshall/.config/dolphinrc /home/marshall/.config/emaildefaults /home/marshall/.config/emailidentities /home/marshall/.config/gtkrc /home/marshall/.config/gtkrc-2.0 /home/marshall/.config/gwenviewrc /home/marshall/.config/kactivitymanagerd-statsrc /home/marshall/.config/kactivitymanagerdrc /home/marshall/.config/katemetainfos /home/marshall/.config/katerc /home/marshall/.config/kateschemarc /home/marshall/.config/katevirc /home/marshall/.config/kcminputrc /home/marshall/.config/kconf_updaterc /home/marshall/.config/kded5rc /home/marshall/.config/kdeglobals /home/marshall/.config/kfontinstuirc /home/marshall/.config/kglobalshortcutsrc /home/marshall/.config/khotkeysrc /home/marshall/.config/kiorc /home/marshall/.config/kmail2rc /home/marshall/.config/kmenueditrc /home/marshall/.config/kmixrc /home/marshall/.config/konsolesshconfig /home/marshall/.config/kritadisplayrc /home/marshall/.config/kritarc /home/marshall/.config/krunnerrc /home/marshall/.config/kscreenlockerrc /home/marshall/.config/ksmserverrc /home/marshall/.config/ktimezonedrc /home/marshall/.config/kwalletrc /home/marshall/.config/kwinrc /home/marshall/.config/kwinrulesrc /home/marshall/.config/kxkbrc /home/marshall/.config/mimeapps.list /home/marshall/.config/okularpartrc /home/marshall/.config/plasma-localerc /home/marshall/.config/plasma-org.kde.plasma.desktop-appletsrc /home/marshall/.config/plasma-welcomerc /home/marshall/.config/plasmanotifyrc /home/marshall/.config/plasmashellrc /home/marshall/.config/QtProject.conf /home/marshall/.config/specialmailcollectionsrc /home/marshall/.config/spectaclerc /home/marshall/.config/systemsettingsrc /home/marshall/.config/trashrc /home/marshall/.config/Trolltech.conf /home/marshall/.config/webengineurlinterceptoradblockrc /home/marshall/.local/share/dolphin /home/marshall/.local/share/kded5 /home/marshall/.local/share/kwalletd /home/marshall/.local/share/kwrite /home/marshall/.local/share/kpeople /home/marshall/.local/share/gwenview /home/marshall/.local/share/kactivitymanagerd /home/marshall/.local/share/kate /home/marshall/.local/share/kcookiejar /home/marshall/.local/share/KDE /home/marshall/.local/share/kded5 /home/marshall/.local/share/klipper /home/marshall/.local/share/knewstuff3 /home/marshall/.local/share/konsole /home/marshall/.local/share/kpeoplevcard /home/marshall/.local/share/krita /home/marshall/.local/share/kscreen /home/marshall/.local/share/kwalletd /home/marshall/.local/share/local-mail /home/marshall/.local/share/remoteview /home/marshall/.local/share/sddm /home/marshall/.local/share/user-places.xbel.bak /home/marshall/.local/share/krunnerstaterc /home/marshall/.local/share/user-places.xbel.tbcache /home/marshall/.local/share/krita-sysinfo.log /home/marshall/.local/share/krita.log /home/marshall/.local/share/recently-used.xbel /home/marshall/.local/share/user-places.xbel /home/marshall/.gtkrc-2.0 /home/marshall/.config/defaultcalendarrc /home/marshall/.config/emaildefaults /home/marshall/.config/emailidentities /home/marshall/.config/harunarc /home/marshall/.config/kalendaracrc /home/marshall/.config/kalendarrc /home/marshall/.config/merkuro.calendarrc /home/marshall/.config/powerdevilrc /home/marshall/.config/powermanagementprofilesrc /home/marshall/.config/specialmailcollectionsrc /home/marshall/.config/systemmonitorrc /home/marshall/.config/webengineurlinterceptoradblockrc /home/marshall/.local/share/akonadi /home/marshall/.local/share/akonadi_migration_agent /home/marshall/.local/share/apps /home/marshall/.local/share/contacts /home/marshall/.local/share/kwalletd /home/marshall/.local/share/local-mail /home/marshall/.config/arkrc /home/marshall/.config/baloofileinformationrc /home/marshall/.config/kalendaracrc /home/marshall/.config/plasma.emojierrc /home/marshall/.config/PlasmaDiscoverUpdates /home/marshall/.config/plasma-org.kde.plasma.desktop-appletsrc /home/marshall/.local/share/ark /home/marshall/.local/share/kwalletd /home/marshall/.local/share/okular /home/marshall/.local/share/plasma-systemmonitor
        fi
    else
        sudo systemctl enable gdm && sleep 1 && clear

    fi
    echo "Limpando PACMAN..." && sleep 3 && clear

    yay -Yc --noconfirm ; yay -Sc --noconfirm ; clear

    read -p $'Reiniciar o sistema? (s/N): ' REBOOT
    REBOOT="${REBOOT:-"N"}"
    if [ ${REBOOT^^} = "S" ]; then
        echo "Reiniciando" && sleep 3
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

            sudo pacman -Rsn "${GNOME_PACKAGES[@]}" --noconfirm

            clear

            echo "Removendo dotfiles" && sleep 3 && clear

            rm -rf /home/marshall/.cache/ /home/marshall/.config/BraveSoftware /home/marshall/.config/chromium /home/marshall/.config/dconf /home/marshall/.config/evolution /home/marshall/.config/gnome-control-center /home/marshall/.config/goa-1.0 /home/marshall/.config/google-chrome /home/marshall/.config/google-chrome-beta /home/marshall/.config/google-chrome-unstable /home/marshall/.config/gsconnect /home/marshall/.config/gtk-3.0 /home/marshall/.config/gtk-4.0 /home/marshall/.config/Kvantum /home/marshall/.config/menus /home/marshall/.config/microsoft-edge-beta /home/marshall/.config/microsoft-edge-dev /home/marshall/.config/nautilus /home/marshall/.config/.gsd-keyboard.settings-ported /home/marshall/.config/baloofileinformationrc /home/marshall/.gnome /home/marshall/.local/share/applications/avahi-discover.desktop /home/marshall/.local/share/applications/bssh.desktop /home/marshall/.local/share/applications/bvnc.desktop /home/marshall/.local/share/applications/code.desktop /home/marshall/.local/share/applications/libreoffice-base.desktop /home/marshall/.local/share/applications/libreoffice-draw.desktop /home/marshall/.local/share/applications/libreoffice-math.desktop /home/marshall/.local/share/applications/libreoffice-startcenter.desktop /home/marshall/.local/share/applications/lstopo.desktop /home/marshall/.local/share/applications/menulibre.desktop /home/marshall/.local/share/applications/mpv.desktop /home/marshall/.local/share/applications/org.gnome.DiskUtility.desktop /home/marshall/.local/share/applications/org.gnome.Evince.desktop /home/marshall/.local/share/applications/org.gnome.FileRoller.desktop /home/marshall/.local/share/applications/org.gnome.font-viewer.desktop /home/marshall/.local/share/applications/org.gnome.Loupe.desktop /home/marshall/.local/share/applications/org.gnome.Shell.Extensions.GSConnect.desktop /home/marshall/.local/share/applications/org.gnome.Shell.Extensions.GSConnect.Preferences.desktop /home/marshall/.local/share/applications/qv4l2.desktop /home/marshall/.local/share/applications/qvidcap.desktop /home/marshall/.local/share/applications/vim.desktop /home/marshall/.local/share/backgrounds /home/marshall/.local/share/baloo /home/marshall/.local/share/desktop-directories /home/marshall/.local/share/evolution /home/marshall/.local/share/gnome-control-center-goa-helper /home/marshall/.local/share/gnome-settings-daemon /home/marshall/.local/share/gnome-shell /home/marshall/.local/share/gvfs-metadata /home/marshall/.local/share/keyrings /home/marshall/.local/share/nautilus /home/marshall/.local/share/nautilus-python /home/marshall/.local/share/nemo-python /home/marshall/.local/share/org.gnome.TextEditor /home/marshall/.mozilla/firefox/*default*/chrome
        fi
    else
        sudo systemctl enable sddm && sleep 1 && clear

    fi
    echo "Limpando PACMAN..." && sleep 3 && clear

    yay -Yc --noconfirm ; yay -Sc --noconfirm ; clear

    read -p $'Reiniciar o sistema? (s/N): ' REBOOT
    REBOOT="${REBOOT:-"N"}"
    if [ ${REBOOT^^} = "S" ]; then
        echo "Reiniciando" && sleep 3
        reboot
    else
        echo "Encerrando script de instalação..."
    fi
else
    echo 'Opção inválida'
fi
