#!/bin/bash
set -e
sudo mkdir -p /opt/firefox-pwa/"$USER"
sudo chown "$USER":"$USER" /opt/firefox-pwa/"$USER"
mkdir -p /opt/firefox-pwa/"$USER"/"$1"
if [ -d /usr/share/icons/Papirus ];then
    if [ -f /usr/share/icons/Papirus/64x64/apps/"$(echo $1|tr '[:upper:]' '[:lower:]')".svg ];then
        echo "$1 encontrado no seu tema de ícones"
        else
        echo "$1 não encontrado no seu tema de ícones, baixando o favicon do site..."
        mkdir -p "$HOME"/.local/share/icons/
        wget -cq --show-progress -O "$HOME"/.local/share/icons/"$(echo $1|tr '[:upper:]' '[:lower:]')".png "https://www.google.com/s2/favicons?domain=$2&sz=256"||\
        wget -cq --show-progress -O "$HOME"/.local/share/icons/"$(echo $1|tr '[:upper:]' '[:lower:]')".png "https://www.google.com/s2/favicons?domain=$(echo $2|cut -d '.' -f2-3)&sz=256"
    fi
    else
    echo 'Tema de ícones Papirus não encontrado, baixando o favicon do site...'
    mkdir -p "$HOME"/.local/share/icons/
    wget -cq --show-progress -O "$HOME"/.local/share/icons/"$(echo $1|tr '[:upper:]' '[:lower:]')".png "https://www.google.com/s2/favicons?domain=$2&sz=256"||\
    wget -cq --show-progress -O "$HOME"/.local/share/icons/"$(echo $1|tr '[:upper:]' '[:lower:]')".png "https://www.google.com/s2/favicons?domain=$(echo $2|cut -d '.' -f2-3)&sz=256"
fi
if [ "$4" ];then
    cat <<EOF |tee /opt/firefox-pwa/"$USER"/"$1"/script.sh>/dev/null
#!/bin/bash
set -e
PWA='$1'
ADDRESS='$2'
TRAY='$3'
ATTENTION='$4'
mkdir -p /opt/firefox-pwa/"\$USER"/"\$PWA"/profile/chrome
wget -qO /opt/firefox-pwa/"\$USER"/"\$PWA"/profile/chrome/userChrome.css https://raw.githubusercontent.com/rauldipeas/fpwa/main/webapp-userChrome.css
wget -qO /opt/firefox-pwa/"\$USER"/"\$PWA"/profile/user.js https://raw.githubusercontent.com/rauldipeas/fpwa/main/webapp-user.js
export MOZ_USE_XINPUT2=1
kdocker -i "\$TRAY" -I "\$ATTENTION" -d15 -mq firefox --name="\$PWA" --class="\$PWA" -no-remote --profile "/opt/firefox-pwa/\$USER/\$PWA/profile" \$ADDRESS
EOF
    elif [ "$3" ];then
    cat <<EOF |tee /opt/firefox-pwa/"$USER"/"$1"/script.sh>/dev/null
#!/bin/bash
set -e
PWA='$1'
ADDRESS='$2'
TRAY='$3'
mkdir -p /opt/firefox-pwa/"\$USER"/"\$PWA"/profile/chrome
wget -qO /opt/firefox-pwa/"\$USER"/"\$PWA"/profile/chrome/userChrome.css https://raw.githubusercontent.com/rauldipeas/fpwa/main/webapp-userChrome.css
wget -qO /opt/firefox-pwa/"\$USER"/"\$PWA"/profile/user.js https://raw.githubusercontent.com/rauldipeas/fpwa/main/webapp-user.js
export MOZ_USE_XINPUT2=1
kdocker -i \$TRAY -d15 -mq firefox --name="\$PWA" --class="\$PWA" -no-remote --profile "/opt/firefox-pwa/\$USER/\$PWA/profile" \$ADDRESS
EOF
    else
    cat <<EOF |tee /opt/firefox-pwa/"$USER"/"$1"/script.sh>/dev/null
#!/bin/bash
set -e
PWA='$1'
ADDRESS='$2'
mkdir -p /opt/firefox-pwa/"\$USER"/"\$PWA"/profile/chrome
wget -qO /opt/firefox-pwa/"\$USER"/"\$PWA"/profile/chrome/userChrome.css https://raw.githubusercontent.com/rauldipeas/fpwa/main/webapp-userChrome.css
wget -qO /opt/firefox-pwa/"\$USER"/"\$PWA"/profile/user.js https://raw.githubusercontent.com/rauldipeas/fpwa/main/webapp-user.js
export MOZ_USE_XINPUT2=1
firefox --name="\$PWA" --class="\$PWA" -no-remote --profile "/opt/firefox-pwa/\$USER/\$PWA/profile" \$ADDRESS
EOF
fi
mkdir -pv "$HOME"/.local/share/applications/firefox-pwa
cat <<EOF |tee "$HOME"/.local/share/applications/firefox-pwa/"$1".desktop>/dev/null
[Desktop Entry]
Type=Application
Name=$1
Icon=$(echo $1|tr '[:upper:]' '[:lower:]')
NoDisplay=false
Exec=bash /opt/firefox-pwa/$USER/$1/script.sh
Terminal=false
X-GNOME-UsesNotifications=true
EOF
if [ -f /usr/bin/kbuildsycoca5 ];then
    kbuildsycoca5
fi