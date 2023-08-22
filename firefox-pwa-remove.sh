#!/bin/bash
set -e
rm -rf /opt/firefox-pwa/"$USER"/"$1"\
    "$HOME"/.local/share/applications/firefox-pwa/"$1".desktop\
    "$HOME"/.local/share/icons/"$(echo $1|tr '[:upper:]' '[:lower:]')".png
if [ -f /usr/bin/kbuildsycoca5 ];then
    kbuildsycoca5
fi