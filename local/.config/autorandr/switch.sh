#!/usr/bin/env bash



if [ "$AUTORANDR_CURRENT_PROFILE" = "4k"]; then
    # set dpi for most applications
    sed -i -e 's/Xft.dpi: [0-9]*$/Xft.dpi: 144/g' "$HOME"/.Xresources
    
    # force scaling of spotify, dpi scaling doesn't work
    sed -i -e 's/Exec=spotify \%U/Exec=spotify --force-device-scale-factor=1.5 %U/g' \ 
        "$HOME"/.local/share/applications/spotify.desktop

    xrandr --dpi 144


elif [ "$AUTORANDR_CURRENT_PROFILE" = "ntb"]; then
    sed -i -e 's/Xft.dpi: [0-9]*$/Xft.dpi: 96/g' "$HOME"/.Xresources

    sed -i -e 's/Exec=spotify --force-device-scale-factor=1.5 \%U/Exec=spotify %U/g' \ 
        "$HOME"/.local/share/applications/spotify.desktop

    xrandr --dpi 96
fi


# restart polybar after switch
$HOME/.config/polybar/launch.sh &
