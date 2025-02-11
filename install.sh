if ! dpkg -l | grep -q libfuse2; then
    sudo apt-get update
    sudo apt-get install -y libfuse2
fi

curl -L https://downloader.cursor.sh/linux/appImage/x64 -o cursor.appimage

chmod +x ./cursor.appimage

mkdir /opt/cursor
mv ./cursor.appimage /opt/cursor/cursor.appimage
mv ./cursor.png /opt/cursor/cursor.png

cat << EOF > /usr/share/applications/cursor.desktop
[Desktop Entry]
Name=Cursor
Exec=/opt/cursor/cursor.appimage --no-sandbox
Icon=/opt/cursor/cursor.png
Type=Application
Categories=Development;
EOF


if [ -f ~/.bashrc ]
then
    echo "alias cursor='/opt/cursor/cursor.appimage --no-sandbox'" >> ~/.bashrc
fi

if [ -f ~/.zshrc ]
then
    echo "alias cursor='/opt/cursor/cursor.appimage --no-sandbox'" >> ~/.zshrc
fi
