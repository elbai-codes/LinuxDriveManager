#!/usr/bin/env bash
echo "I TOLD YOU NOT TO INSTALL. THIS IS UNFINISHED!!!
UNLESS YOU DON'T CARE ABOUT DRIVE SAFETY AND INTEGRITY
TYPE THE NAME JOE IN ALL LOWERCASE TO PROCEED"
read n
if [[ "$n" =/= "joe" ]] then
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
    
