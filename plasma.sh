#!/bin/sh

echo "Instalando Plasma" && sleep 3

clear

sudo pacman -Syu plasma sddm sddm-kcm plasma-wayland-session plasma-wayland-protocols dolphin ark kcalc kate kdeconnect gwenview haruna okular spectacle konsole packagekit-qt5 qt5-imageformats kwalletmanager partitionmanager ffmpegthumbs ffmpegthumbnailer --noconfirm
sudo pacman -Rsn oxygen plasma-sdk plasma-welcome --noconfirm
mkdir /home/marshall/.config/fontconfig/ && wget https://raw.githubusercontent.com/GaKu999/dotfiles/main/.config/fontconfig/fonts.conf -O ~/.config/fontconfig/fonts.conf

clear

echo "Atualizando DM" && sleep 3

clear 

sudo systemctl disable gdm && sudo systemctl enable sddm && sleep 1

clear

echo "Removendo Gnome" && sleep 3

clear

sudo pacman -Rcsn gnome gnome-tweaks gnome-themes-extra gnome-browser-connector file-roller xdg-desktop-portal-gnome python-nautilus celluloid kvantum adw-gtk-theme menulibre --noconfirm

clear

echo "Removendo dotfiles" && sleep 3

clear

rm -rf /home/marshall/.cache/ /home/marshall/.config/BraveSoftware /home/marshall/.config/chromium /home/marshall/.config/dconf /home/marshall/.config/evolution /home/marshall/.config/gnome-control-center /home/marshall/.config/goa-1.0 /home/marshall/.config/google-chrome /home/marshall/.config/google-chrome-beta /home/marshall/.config/google-chrome-unstable /home/marshall/.config/gsconnect /home/marshall/.config/gtk-3.0 /home/marshall/.config/gtk-4.0 /home/marshall/.config/Kvantum /home/marshall/.config/menus /home/marshall/.config/microsoft-edge-beta /home/marshall/.config/microsoft-edge-dev /home/marshall/.config/nautilus /home/marshall/.config/.gsd-keyboard.settings-ported /home/marshall/.config/baloofileinformationrc /home/marshall/.gnome /home/marshall/.local/share/applications /home/marshall/.local/share/backgrounds /home/marshall/.local/share/baloo /home/marshall/.local/share/desktop-directories /home/marshall/.local/share/evolution /home/marshall/.local/share/gnome-control-center-goa-helper /home/marshall/.local/share/gnome-settings-daemon /home/marshall/.local/share/gnome-shell /home/marshall/.local/share/gvfs-metadata /home/marshall/.local/share/nautilus /home/marshall/.local/share/nautilus-python /home/marshall/.local/share/nemo-python /home/marshall/.local/share/org.gnome.TextEditor /home/marshall/.mozilla/firefox/*default*/chrome /home/marshall/.zsh_history

echo "Reiniciando" && sleep 3

reboot
