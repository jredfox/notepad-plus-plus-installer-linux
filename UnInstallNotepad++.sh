#!/bin/bash

rm -rf "$HOME/notepad++"
rm -f "$HOME/Desktop/notepad++.desktop"
rm -f "$HOME/.local/share/applications/notepad++.desktop"
update-desktop-database "$HOME/.local/share/applications/"
echo "Notepad++ Has been Uninstalled For the Current User!"