#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 
wine regedit /C "Wine-DarkTheme.reg"
wineserver -k