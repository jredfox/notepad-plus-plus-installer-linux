#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 
wine reg import "Wine-DarkTheme-Uninstall.reg"
wineserver -k
