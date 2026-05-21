#!/bin/bash

echo -e "Welcome user to new arch installation:\t\n"
echo -e "Just rest back, and drink coffee ha! ha!\n"

# Update system and install packages automatically without prompting
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm gcc nasm vim kitty git firefox make gdb ttf-jetbrains-mono noto-fonts-emoji noto-fonts bat

echo -e "\nWe have installed some useful packages, hold on for some customization:\n"

# Create required directories (-p ensures no errors if they exist)
mkdir -p ~/.config/sway
mkdir -p ~/.config/fonts
mkdir -p ~/.temporary

# Clone the configuration repository
git clone https://github.com/operation123octopus-boop/Sway-debian-ConfigFiles ~/.temporary/Sway-debian-ConfigFiles

# Navigate into the cloned repository
cd ~/.temporary/Sway-debian-ConfigFiles || exit

# Remove the README.md 
rm -f README.md

# Move the directories if they exist in the repo
if [ -d "sway" ]; then
    cp -a sway/. ~/.config/sway/
fi

if [ -d "fonts" ]; then
    cp -a fonts/. ~/.config/fonts/
fi

# Move any loose configuration files at the root into the sway directory
find . -maxdepth 1 -type f -exec cp {} ~/.config/sway/ \;

# Ensure the mount point exists
sudo mkdir -p /mnt/extra

# Configure persistent mount in /etc/fstab
echo -e "\nConfiguring persistent mount in /etc/fstab..."
UUID=$(sudo blkid -s UUID -o value /dev/sda1)

if [ -n "$UUID" ]; then
    # Check if it already exists to prevent duplicate entries on rerun
    if ! grep -q "$UUID" /etc/fstab; then
        echo "UUID=$UUID /mnt/extra auto defaults,nofail 0 2" | sudo tee -a /etc/fstab
        echo "Added /dev/sda1 to /etc/fstab using UUID."
    else
        echo "Mount entry for this UUID already exists in /etc/fstab."
    fi
else
    # Fallback to device path if UUID can't be extracted
    if ! grep -q "/dev/sda1" /etc/fstab; then
        echo "/dev/sda1 /mnt/extra auto defaults,nofail 0 2" | sudo tee -a /etc/fstab
        echo "Added /dev/sda1 to /etc/fstab using device path."
    fi
fi

# Mount the partition immediately for the current session
sudo mount -a

# Refresh Sway to apply the new configurations
swaymsg reload

echo -e "\nSetup complete! Sway has been reloaded."
