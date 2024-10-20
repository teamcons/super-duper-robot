#!/bin/bash
# Save some shit

#Save bashrc
#cat ~/.bashrc > ./bashrc

#Save flatpak apps
flatpak list --columns=application --app | grep -v "org.gnome." | grep -v "io.elementary." | tee  > ./flatlist_apps

flatpak list --columns=application --app | grep "org.gnome." > ./gnome_flatlist

flatpak list --columns=application --app | grep "io.elementary." > ./eos_flatlist


#Save GNOME extensions
#ls ~/.local/share/gnome-shell/extensions/ | cat > gnome_extensionlist
#tar -cf extensions.tar ~/.local/share/gnome-shell/extensions/

echo "Everything saved"
