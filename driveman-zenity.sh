#!/usr/bin/env bash
echo -e "running Linux Drive Manager v2.0.0 'Seeing Sam'"
command=$(zenity --info \
         --title="LDM v2.0.0" \
         --text="choose a command to run" \
         --ok-label="Exit" \
         --extra-button="List Drives" \
         --extra-button="Erase Drive" \
         --extra-button="Format Drive" \
         --extra-button="Check Drive Integrity" \
         --extra-button="Mount Drive" \
         --extra-button="Unmount Drive")

case "$command" in
  "List Drives")
    prqLSBLK=$(lsblk)
    zenity --info --text="$prqLSBLK"
    ;;
  "Erase Drive")
    edrive=$(zenity --entry --text="Which drive?")
    econf=$(zenity --entry --text="WARNINGWARNINGWARNING YOU ARE ABOUT TO ERASE $edrive
ARE YOU SURE??? (y/n)")
    if [[ "$econf" = "y" || "$econf" = "Y" ]]; then
      econf2=$(zenity --entry --text="SUPER SUPER SURE??? (y/n)")
      if [[ "$econf2" = "y" || "$econf2" = "Y" ]]; then
        zenity --info --text="Erasing"
        sudo dd if=/dev/zero of="$edrive" bs=4M status=progress
        exit 0
      else
        zenity --info --text="Terminating session..."
        exit 0
      fi
    else
      zenity --info --text="Terminating session..."
      exit 0
    fi
    ;;
  "Format Drive")
    fdrive=$(zenity --entry --text="Which drive to format?")
    fsystem=$(zenity --entry --text="Which filesystem?")
    fconf=$(zenity --entry --text="WARNINGWARNINGWARNING YOU ARE ABOUT TO FORMAT $fdrive
ARE YOU SURE??? (y/n)")
    if [[ "$fconf" = "y" || "$fconf" = "Y" ]]; then
      fconf2=$(zenity --entry --text="SUPER SURE??? TYPE OUT $fdrive TO CONFIRM")
      if [[ "$fconf2" = "$fdrive" ]]; then
        zenity --entry --text="Formatting..."
        sudo mkfs."${fsystem,,}" "$fdrive"
        exit 0
      else
        zenity --info --text="Terminating session..."
        exit 0
      fi
    else
      zenity --info --text="Terminating session..."
      exit 0
    fi
  ;;
  "Check Drive Integrity")
    fsdrive=$(zenity --entry --text="Which drive do you wanna check?")
    fsinteg=$(sudo fsck -f "$fsdrive")
    zenity --info --text="$fsinteg"
  ;;
  "Mount Drive")
    mdrive=$(zenity --entry --text="Which drive do you wanna mount?")
    mpoint=$(zenity --entry --text="Where to mount?")
    sudo mount "$mdrive" "$mpoint"
    zenity --info --text="Mounted!"
  ;;
  "Unmount Drive")
    umdrive=$(zenity --entry --text="Which drive do you wanna unmount?")
    sudo umount "$umdrive"
  ;;
  *)
    zenity --info --text="Terminating session..."
    exit 0
  ;;
esac
