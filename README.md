# GNOME-DEBIAN SETUP
---
## Setup Instructions:

### Basic Essentials:
1. get the $USER to sudo
   ```bash
   su - #provide password
   usermod -aG sudo "$USER"

   exit #exit sudo
   sudo systemctl reboot
   
   ```

2. Install uv
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh

   ```
3. Install nodejs, npm, git
   ```bash
        sudo apt install git nodejs npm --no-install-recommends
    ```

4. {**OPTIONAL**}Install flatpak:
   ```bash
    sudo apt install flatpak
    sudo apt install gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    sudo systemctl reboot
   ```
### Applications:
1. {**OPTIONAL**}Installing libreoffice using flatpak:
   ```bash
   #removing preinstalled libreoffice
   sudo apt purge "libreoffice*"
   sudo apt autoremove --purge
   rm -rf ~/.config/libreoffice
   rm -rf ~/.local/share/recently-used.xbel
   sudo apt clean

   #installing libreoffice from flatpak
   flatpak install flathub org.libreoffice.LibreOffice

   ```
2. Installing vim:
   ```bash
     sudo apt install vim --no-install-recommends
   ```
3. {**OPTIONAL**} Install LSP (C):
   
   Note: You may need to install *build-essentials* package with the *--no-install-recommends* flag for C.
   ```bash
   sudo apt install clangd --no-install-recommends
   ```
4. {**OPTIONAL**} Install GNU Debugger:
   Note: Install if require
   ```bash
   sudo apt install gdb --no-install-recommends
   ```
### Configuring vim:
1. Copy the ***.vimrc*** to ***~/*** directory
2. Download vim-plug by using:
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```
3. Type ***PlugInstall*** in command mode of vim
4. **BOOM** done 😁😁

### Final:
1. Do a reboot
2. **DO NOT INSTALL USELESS THINGS**

---
# NOW ITS DONE!!!
---

   
   
