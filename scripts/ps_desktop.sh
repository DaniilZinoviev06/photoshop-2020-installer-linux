#!/bin/bash

source ./scripts/general.sh

INFO="[Desktop Entry]
Version=1.0
Type=Application
Name=Photoshop CC 2020
StartupNotify=true
Comment=Advanced image editing application
Exec=env WINEPREFIX=\"$WINE_PREF_PATH\" wine \"$PHOTOSHOP\"
Icon=$HOME/.local/share/icons/photoshop_icon.png
StartupWMClass=photoshop.exe
"

# StartupWMClass: i spotted this from Gictorbit. Thanks to him for this

createDesktopFunc() {
    if [ ! -f "$ICON" ]; then
        show_message_bad "\e[93mphotoshop_icon.png\e[0m not found..."
    else
        mkdir -p "$HOME/.local/share/icons/"
        cp "$ICON" "$HOME/.local/share/icons/"
    fi

    echo "$INFO" > "$DESKTOP_FILE"

    show_message_info "Desktop file created in \e[93m${HOME}/.local/share/applications/\e[0m..."
}


