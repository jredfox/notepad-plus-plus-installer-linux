# Discontinued
- Project is discontinued due to the fact you can now install windows applications on wine calling `wine npp.<version>.Installer.x64.exe`! When I looked online there was no documentation that it could be done through wine nor did chatgpt suggest it either
- The only Real use is using `bash InstallWineDarkTheme.sh` to make wine use the dark theme. On windows it's two registry edits on wine it's a whole process involving lots of registry edits

# notepad-plus-plus-installer-linux
 Install Notepad++ On Linux the Easy Way!
 
# Usage:
- Download Notepad++ Portable Zip from their official website [https://notepad-plus-plus.org/](https://notepad-plus-plus.org/downloads/)
- **sudo** apt update && **sudo** apt install zip unzip icoutils wine
- **bash** `InstallNotepad++.sh` to install with the normal icon
- **bash** `InstallNotepad++.sh T` to install with the classic icon

# Using Different Icons:
- Notepad++ contains 10 icons located inside of `~/notepad++/icons` you can edit the `notepad++.desktop` found on your desktop and change the icon path to match one of the icons in there. Example: `/home/jredfox/notepad++/icons/notepad++.exe_14_100_2_32x32x8.png`

# Using Dark Mode:
- **bash** `InstallWineDarkTheme.sh`

# System Requirements
- Intel 64 bit processor (x86_64, x64, AMD64) or Intel 32 bit processor (x86, x86_32, i386)
 
 # Legal
 This project contains no code from notepad++ and isn't asociated with anyone from notepad++. It's an offline installer so you can install notepad++ on linux
