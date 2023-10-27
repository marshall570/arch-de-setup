#!/bin/sh

echo "Instalando Gnome" && sleep 3

clear

sudo pacman -Syu gnome gnome-tweaks gnome-themes-extra gnome-browser-connector file-roller xdg-desktop-portal-gnome python-nautilus celluloid --noconfirm
yay -Syu adw-gtk-theme menulibre --noconfirm
sudo pacman -Rsn simple-scan gnome-tour gnome-connections gnome-contacts totem gnome-clocks gnome-maps gnome-music epiphany baobab gnome-user-docs yelp gnome-weather gnome-logs gnome-software gnome-characters snapshot --noconfirm
curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash

echo "Aplicando configurações..." && sleep 1
echo "- Ordenação de arquivos" ; gsettings set org.gnome.nautilus.preferences default-sort-order 'type'
echo "- Tema da interface" ; gsettings set org.gnome.desktop.interface gtk-theme Adw-dark
echo "- Tema de ícones" ; gsettings set org.gnome.desktop.interface icon-theme Adwaita
echo "- Tema do cursor" ; gsettings set org.gnome.desktop.interface cursor-theme Adwaita
echo "- Fonte da interface" ; gsettings set org.gnome.desktop.interface font-name 'Cantarell Regular'
echo "- Botões de janela" ; gsettings set org.gnome.desktop.wm.preferences button-layout ':close'
echo "- Centralização de janelas" ; gsettings set org.gnome.mutter center-new-windows 'true'
echo "- Touchpad em TtoC" ; gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'
echo "- Serviços de localização" ; gsettings set org.gnome.system.location enabled 'true'
echo "- Exclusão de arquivos" ; gsettings set org.gnome.desktop.privacy remove-old-temp-files 'true' && gsettings set org.gnome.desktop.privacy remove-old-trash-files 'true'
echo "- Suspensão automática" ; gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 1800 && gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 900
echo "- Data na barra de tarefas" ; gsettings set org.gnome.desktop.interface clock-show-date 'false'

clear 

echo "Atualizando DM" && sleep 3
sudo systemctl disable sddm && sudo systemctl enable gdm && sleep 1

clear

echo "Removendo Plasma" && sleep 3

clear

sudo pacman -Rsn plasma sddm sddm-kcm plasma-wayland-session plasma-wayland-protocols dolphin ark kcalc kate kdeconnect gwenview haruna okular spectacle konsole ktorrent kwalletmanager partitionmanager packagekit-qt5 qt5-imageformats ffmpegthumbnailer ffmpegthumbs --noconfirm

clear

echo "Removendo dotfiles" && sleep 3

clear

rm -rf /home/marshall/.cache/ /home/marshall/.config/fontconfig/ /home/marshall/.config/gtk-3.0 /home/marshall/.config/gtk-4.0 /home/marshall/.config/kate /home/marshall/.config/KDE /home/marshall/.config/kde.org /home/marshall/.config/kdeconnect /home/marshall/.config/kdedefaults /home/marshall/.config/libaccounts-glib /home/marshall/.config/menus /home/marshall/.config/plasma-workspace /home/marshall/.config/pulse /home/marshall/.config/session /home/marshall/.config/signond /home/marshall/.config/xsettingsd /home/marshall/.config/konsolerc /home/marshall/.config/kwritemetainfos /home/marshall/.config/kwriterc /home/marshall/.config/akregatorrc /home/marshall/.config/baloofilerc /home/marshall/.config/bluedevilglobalrc /home/marshall/.config/defaultcalendarrc /home/marshall/.config/discoverrc /home/marshall/.config/dolphinrc /home/marshall/.config/emaildefaults /home/marshall/.config/emailidentities /home/marshall/.config/gtkrc /home/marshall/.config/gtkrc-2.0 /home/marshall/.config/gwenviewrc /home/marshall/.config/kactivitymanagerd-statsrc /home/marshall/.config/kactivitymanagerdrc /home/marshall/.config/katemetainfos /home/marshall/.config/katerc /home/marshall/.config/kateschemarc /home/marshall/.config/katevirc /home/marshall/.config/kcminputrc /home/marshall/.config/kconf_updaterc /home/marshall/.config/kded5rc /home/marshall/.config/kdeglobals /home/marshall/.config/kfontinstuirc /home/marshall/.config/kglobalshortcutsrc /home/marshall/.config/khotkeysrc /home/marshall/.config/kiorc /home/marshall/.config/kmail2rc /home/marshall/.config/kmenueditrc /home/marshall/.config/kmixrc /home/marshall/.config/konsolesshconfig /home/marshall/.config/kritadisplayrc /home/marshall/.config/kritarc /home/marshall/.config/krunnerrc /home/marshall/.config/kscreenlockerrc /home/marshall/.config/ksmserverrc /home/marshall/.config/ktimezonedrc /home/marshall/.config/kwalletrc /home/marshall/.config/kwinrc /home/marshall/.config/kwinrulesrc /home/marshall/.config/kxkbrc /home/marshall/.config/mimeapps.list /home/marshall/.config/okularpartrc /home/marshall/.config/plasma-localerc /home/marshall/.config/plasma-org.kde.plasma.desktop-appletsrc /home/marshall/.config/plasma-welcomerc /home/marshall/.config/plasmanotifyrc /home/marshall/.config/plasmashellrc /home/marshall/.config/QtProject.conf /home/marshall/.config/specialmailcollectionsrc /home/marshall/.config/spectaclerc /home/marshall/.config/systemsettingsrc /home/marshall/.config/trashrc /home/marshall/.config/Trolltech.conf /home/marshall/.config/webengineurlinterceptoradblockrc /home/marshall/.local/share/dolphin /home/marshall/.local/share/kded5 /home/marshall/.local/share/kwalletd /home/marshall/.local/share/kwrite /home/marshall/.local/share/kpeople /home/marshall/.local/share/gwenview /home/marshall/.local/share/kactivitymanagerd /home/marshall/.local/share/kate /home/marshall/.local/share/kcookiejar /home/marshall/.local/share/KDE /home/marshall/.local/share/kded5 /home/marshall/.local/share/klipper /home/marshall/.local/share/knewstuff3 /home/marshall/.local/share/konsole /home/marshall/.local/share/kpeoplevcard /home/marshall/.local/share/krita /home/marshall/.local/share/kscreen /home/marshall/.local/share/kwalletd /home/marshall/.local/share/local-mail /home/marshall/.local/share/remoteview /home/marshall/.local/share/sddm /home/marshall/.local/share/user-places.xbel.bak /home/marshall/.local/share/krunnerstaterc /home/marshall/.local/share/user-places.xbel.tbcache /home/marshall/.local/share/krita-sysinfo.log /home/marshall/.local/share/krita.log /home/marshall/.local/share/recently-used.xbel /home/marshall/.local/share/user-places.xbel /home/marshall/.gtkrc-2.0 /home/marshall/.zsh_history

echo "Limpando PACMAN" && sleep 3

yay -Yc --noconfirm ; yay -Sc --noconfirm

clear

echo "Reiniciando" && sleep 3

reboot
