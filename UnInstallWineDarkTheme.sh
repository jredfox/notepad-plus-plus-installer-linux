#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]:-$0}")"
wine reg import "WineDarkThemeUninstall.reg"
wineserver -k
