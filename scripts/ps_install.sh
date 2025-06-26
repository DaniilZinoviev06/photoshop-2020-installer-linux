#!/bin/bash

source ./scripts/general.sh
source ./scripts/ps_desktop.sh

launcherFunc() {
    show_message_info "Photoshop is starting..."
    notify-send "Photoshop is starting..."
    WINEPREFIX="$WINE_PREF_PATH" wine "$PHOTOSHOP"
}

installPSFunc() {
    # In tar only .exe btw) Previously, there was not only exe in the container
    local ARCHIVE="https://iusearchbtw.isgood.host/files/photoshop_2020.tar.xz"
    local ARCHIVE_NAME="photoshop_2020.tar.xz"
    local TAR_SHA256="205a782969c8b3f31462e76d3ad463f3a24abdc5c01d59b9a95755376e834b4f"

    mkdir -p "$SCRIPT_DOWNLOADS"

    installArchiveFunc "$ARCHIVE_NAME" "$ARCHIVE" "$TAR_SHA256"

    sleep 5

    show_message_info "Photoshop is installing now. It will take a couple of minutes. Wait..."
    notify-send "Photoshop is installing now. It will take a couple of minutes. Wait..."

    sleep 5

    WINEPREFIX="${WINE_PREF_PATH}" wine "${SCRIPT_DOWNLOADS}/setup.exe" /VERYSILENT  &> /dev/null

    sleep 5

    if [ -f "$HOME/.local/share/applications/wine/Programs/photoshop/photoshop.desktop" ]; then
        rm "$HOME/.local/share/applications/wine/Programs/photoshop/photoshop.desktop"
    fi

    createDesktopFunc

    sleep 5

    launcherFunc
}
