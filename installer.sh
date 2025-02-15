#!/bin/bash

source ./scripts/check_dep.sh
source ./scripts/conf_wine.sh
source ./scripts/ps_install.sh
source ./scripts/uninstaller.sh


source ./scripts/general.sh

main() {
    while true; do

        echo -e "\e[94m######"
        echo -e "#     # #    #  ####  #####  ####   ####  #    #  ####  #####"
        echo -e "#     # #    # #    #   #   #    # #      #    # #    # #    #"
        echo -e "######  ###### #    #   #   #    #  ####  ###### #    # #    #"
        echo -e "#       #    # #    #   #   #    #      # #    # #    # #####"
        echo -e "#       #    # #    #   #   #    # #    # #    # #    # #"
        echo -e "#       #    #  ####    #    ####   ####  #    #  ####  #\e[0m"


        echo -e "\n \e[91m!\e[0m \e[92mMake sure you have the following dependencies installed:\e[0m"
        echo -e " \e[34m-\e[0m \e[93m wine \e[0m"
        echo -e " \e[34m-\e[0m \e[93m winetricks \e[0m"
        echo -e " \e[34m-\e[0m \e[93m curl \e[0m"

        echo -e "\n \e[91m!\e[0m \e[92mDo not change the location of the generated prefix\e[0m"

        echo -e "\n \e[93m!\e[0m After installation, follow the link and read carefully \n\e[95mhttps://github.com/DaniilZinoviev06/photoshop-installer-linux?tab=readme-ov-file#warning-settings\e[0m"

        echo -e "\n \e[91m!\e[0m \e[92mThere are useful links in paragraph 3('info') :)\e[0m"

        echo -e "\n\e[97m-------------------------------------------------------\e[0m"

        echo -e "\n\e[34m|\e[0m \e[92m1 - Install Photoshop\e[0m\n"
        echo -e "\e[34m|\e[0m \e[92m2 - Info\e[0m\n"
        echo -e "\e[34m|\e[0m \e[92m3 - Launch Photoshop\e[0m\n"
        echo -e "\e[34m|\e[0m \e[92m4 - Configure Wine prefix\e[0m\n"
        echo -e "\e[34m|\e[0m \e[92m5 - Delete Photoshop\e[0m\n"

        read -p "Enter: " choice

        case $choice in
            1)
                ver_req

                sleep 5

                wine_setup

                sleep 5

                installPSFunc
            ;;

            2)
                while true; do
                    clear
                    echo -e "Author: "

                    echo -e "\n\e[34m|\e[0m 1 - Back\n"
                    read -p "Enter: " choice

                    case $choice in
                        1)
                            clear
                            break
                        ;;

                        *)
                            clear
                            echo -e "\n-------------------------"
                            echo "Bad enter..."
                            echo "-------------------------"
                        ;;
                    esac

                done
            ;;

            3)
                if [ -f "$PHOTOSHOP" ]; then
                    clear
                    launcherFunc > /dev/null 2>&1
                else
                    clear
                    show_message_bad "First install Photoshop"
                fi
            ;;

            4)
                if [ -d "$WINE_PREF_PATH" ]; then
                    clear
                    WINEPREFIX="$WINE_PREF_PATH" winecfg
                else
                    clear
                    show_message_bad "First install Photoshop"
                fi
            ;;

            5)
                clear
                uninstallFunc
            ;;

            *)
                clear
                echo -e "\n-------------------------"
                echo "Bad enter..."
                echo "-------------------------"
            ;;

        esac

    done
}

main
