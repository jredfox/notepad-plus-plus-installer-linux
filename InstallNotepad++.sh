#!/bin/bash

#Check Deps
if ! output=$(zip "--help" > /dev/null 2>&1); then
    echo "zip command not found"
    missing="T"
fi
if ! output=$(unzip "--help" > /dev/null 2>&1); then
    echo "unzip command not found"
    missing="T"
fi
if ! output=$(wrestool "--help" > /dev/null 2>&1); then
    echo "wrestool command not found"
    missing="T"
fi
if ! output=$(icotool "--help" > /dev/null 2>&1); then
    echo "wrestool command not found"
    missing="T"
fi
if ! output=$(wine "--help" > /dev/null 2>&1); then
    echo "wine command not found"
    missing="T"
fi
if [[ "$missing" == "T" ]]; then
    echo "Missing Deps! try running sudo apt update && sudo apt install zip unzip icoutils wine"
    exit 1
fi

#Prevents Errors
cd "$HOME"

read -p "Enter Notepad++ Zip File:" npp
npp=$(echo "$npp" | tr -d "\"'")

if [ ! -f "$npp" ]; then
    echo "File Doesn't Exist $npp"
    exit 1
fi

#Switch between current and classic icon
if [[ "$1" == T* ]]; then
    icon_npp="notepad++.exe_14_100_7_48x48x32.png"
else
    icon_npp="notepad++.exe_14_100_5_128x128x32.png"
fi

#Install Notepad++ to ~/notepad++
dir_npp="$HOME/notepad++"
rm -rf "$dir_npp"
mkdir -p "$dir_npp/icons"
unzip -q -o "$npp" -d "$dir_npp"

pushd "$dir_npp" >/dev/null

#Extract the icons
wrestool -x -t 14 notepad++.exe -o icons/
find icons -maxdepth 1 -type f ! -name 'notepad++.exe_14_100.ico' -delete
icotool -x "icons/notepad++.exe_14_100.ico" -o icons/

#Create run.sh script
printf '%s\n' \
'#!/bin/bash' \
'cd "$(dirname "${BASH_SOURCE[0]:-$0}")"' \
'exec wine notepad++.exe' > run.sh

#Create .DESKTOP File and Copy it to the Users Current Desktop
printf '%s\n' \
"[Desktop Entry]" \
"Categories=TextEditor;Development;" \
"Exec=$dir_npp/run.sh" \
"Icon=$dir_npp/icons/$icon_npp" \
"MimeType=" \
"Name=Notepad++" \
"Path=" \
"StartupNotify=true" \
"Terminal=false" \
"TerminalOptions=" \
"Type=Application" \
"X-DBUS-ServiceName=" \
"X-DBUS-StartupType=" \
"X-KDE-SubstituteUID=false" \
"X-KDE-Username=" \
> "notepad++.desktop"
npp_desktop="$HOME/Desktop/notepad++.desktop"
npp_desktop_srch="$HOME/.local/share/applications/notepad++.desktop"
cp -f "notepad++.desktop" "$npp_desktop"
mkdir -p "$HOME/.local/share/applications"
cp -f "notepad++.desktop" "$npp_desktop_srch"
chmod +x "$npp_desktop"
chmod +x "$npp_desktop_srch"

popd >/dev/null

#Make Notepad++ executeable
chmod -R +x "$dir_npp"

#Update .DESKTOP so it shows in search without reboot
update-desktop-database "$HOME/.local/share/applications/"

echo "Notepad++ Has been Installed For the Current User!"