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

3. Install flatpak:
   ```bash
    sudo apt install flatpak
    sudo apt install gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    sudo systemctl reboot
   ```
### Applications:
1. Installing libreoffice using flatpak:
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
2. Installing helix:
   ```bash
     sudo apt install hx --no-install-recommends
   ```
3. {OPTIONAL} Install LSP (C and Python3):
   
   Note: You may need to install *build-essentials* package with the *--no-install-recommends* flag for C.
   ```bash
   sudo apt install clangd --no-install-recommends
   uv tool install basedpyright ruff
   ```
   Note: paste the *config.toml* and *lanuages.toml* in *~/.config/helix/* and then run:
   ```bash
   hx --health c #check the C programming health
   hx --heath python #check python heatlh
   ```
5. {OPTIONAL} Install GNU Debugger:
   Note: Install if require
   ```bash
   sudo apt install gdb --no-install-recommends
   ```

### Final:
1. Change to Large Text in Accessibility menu
2. Do a reboot
3. **DO NOT INSTALL USELESS THINGS**

---
# NOW ITS DONE!!!
---

   
   
