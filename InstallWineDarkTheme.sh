#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 
wine regedit /C "WineDarkTheme.reg"
wineserver -k
