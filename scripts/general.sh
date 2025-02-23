#!/bin/bash

SCRIPT_FOLDER="$HOME/.photoshop_2020"
WINE_PREF_PATH="$SCRIPT_FOLDER/ps_prefix"
SCRIPT_DOWNLOADS="$SCRIPT_FOLDER/ps_downloads"
PHOTOSHOP="$WINE_PREF_PATH/drive_c/Program Files/Adobe/Adobe Photoshop 2020/Photoshop.exe"
LOG_FILE="$WINE_PREF_PATH/winetricks_install.log"
DESKTOP_FILE="$HOME/.local/share/applications/photoshop_2020.desktop"
ICON="$(pwd)/images/photoshop_icon.png"
DESKTOP_ICON="$HOME/.local/share/icons/photoshop_icon.png"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
PLAIN="\e[0m"

show_message_bad() {
    echo "-----------------------------"
    echo -e "${RED}[ bad ]${PLAIN} $1"
    echo "-----------------------------"
}

show_message_ok() {
    echo "-----------------------------"
    echo -e "${GREEN}[ ok ]${PLAIN} $1"
    echo "-----------------------------"
}

show_message_info() {
    echo "-----------------------------"
    echo -e "${YELLOW}[ info ]${PLAIN} $1"
    echo "-----------------------------"
}

show_question() {
    local default_display
    local no_expr=$(locale noexpr)
    local yes_expr=$(locale yesexpr)

    if [[ "$2" == "y" ]]; then
        default_display="Y/n"
    else
        default_display="y/N"
    fi

    local enter=""
    echo -e "${BLUE}[ question ]${PLAIN} "$1" [$default_display] "
    read -r enter

    if [[ -z "$enter" ]]; then
        enter="$2"
    fi

    if [[ "$enter" =~ $no_expr ]]; then
        enter_res="no"
    elif [[ "$enter" =~ $yes_expr ]]; then
        enter_res="yes"
    else
        enter_res="invalid"
    fi
}

# 2 params: archive name and url
installArchiveFunc() {

    mkdir -p "$SCRIPT_DOWNLOADS"

    local count=0
    show_message_info "Download the archive. It may take time"

    while true; do
        if [ $count -ge 5 ]; then
            show_message_bad "Failed to upload file $1"
            exit
        else
            if [ -f "${SCRIPT_DOWNLOADS}/$1" ]; then
                show_message_ok "File uploaded"

                local file_checksum=$(sha256sum "${SCRIPT_DOWNLOADS}/$1" | awk '{print $1}')

                show_message_info "sha256sum..."

                if [ $file_checksum == $3 ]; then
                    show_message_ok "Checksum ok..."

                    if [ -f "${SCRIPT_DOWNLOADS}/setup.exe" ]; then
                        show_message_ok "setup.exe exist..."
                    else
                        tar -xJvf "${SCRIPT_DOWNLOADS}/$1" -C "${SCRIPT_DOWNLOADS}"
                        if [[ $? -ne 0 ]]; then
                            show_message_error "Error when opening archive. Exit..."
                            exit
                        fi
                    fi

                    break
                else
                    show_message_bad "Checksum problem. Re-try..."
                    if [ -f "${SCRIPT_DOWNLOADS}/$1" ]; then
                        rm "${SCRIPT_DOWNLOADS}/$1"
                    fi
                fi
            else
                curl -o "${SCRIPT_DOWNLOADS}/$1" "$2"
            fi
            ((count++))
        fi
    done
}
