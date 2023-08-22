#!/bin/bash
set -e
sudo mkdir -p /usr/local/bin
wget -q https://raw.githubusercontent.com/rauldipeas/fpwa/main/firefox-pwa-create.sh
sudo install firefox-pwa-create.sh /usr/local/bin/fpwa-create
wget -q https://raw.githubusercontent.com/rauldipeas/fpwa/main/firefox-pwa-remove.sh
sudo install firefox-pwa-creator.sh /usr/local/bin/fpwa-remove
rm firefox-pwa-create.sh firefox-pwa-remove.sh