curl https://downloader.cursor.sh/linux/appImage/x64 -o cursor.appimage

curl https://downloader.cursor.sh/linux/appImage/x64.png -o cursor.png

chmod +x ./cursor.appimage

mv ./cursor.appimage /opt/cursor.appimage

cat << EOF > /usr/share/applications/cursor.desktop
[Desktop Entry]
Name=Cursor
Exec=/opt/cursor.appimage
Icon=/opt/cursor.png
Type=Application
Categories=Development;
EOF
