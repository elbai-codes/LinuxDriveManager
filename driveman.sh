#!/usr/bin/env bash
echo -e "\e[1;31m!!! STOP !!!\e[0m"
echo -e "\e[1;31mI WARNED YOU NOT TO RUN THIS SCRIPT!\e[0m"
echo -e "\e[1;33mUNLESS YOU REALLY, TRULY, ABSOLUTELY DON'T CARE ABOUT YOUR DATA!\e[0m"
echo -e "\e[1;31mTYPE THE NAME 'joe' IN ALL LOWERCASE TO PROCEED AT YOUR OWN RISK !!!\e[0m"
read n
if [[ "$n" != "joe" ]]; then
 echo "WRONG!"
 exit 1
fi

echo -e "Type your command\n"
read command
case $command in
  lsblk)
    lsblk
    ;;
  erase)
    read -ep "Which drive? " edrive
    echo -e "WARNINGWARNINGWARNING YOU ARE ABOUT TO ERASE $edrive\n"
    read -ep "ARE YOU SURE??? (y/n) " econf
    if [[ "$econf" = "y" || "$econf" = "Y" ]]; then
      read -ep "ARE YOU SUPER SURE??? (y/n) " econf2
      if [[ "$econf2" = "y" || "$econf2" = "Y" ]]; then
        echo -e "You asked for it...\n"
        sudo dd if=/dev/zero of="$edrive" bs=4M status=progress
        exit 0
      else
        echo "Phew, thank GOD!"
      exit 0
      fi
    else
      echo "Phew, thank GOD!"
    exit 0
    fi
  ;;
    
