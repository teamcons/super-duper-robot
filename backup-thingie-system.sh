#!/bin/bash


BACKUPIMAGE="/media/teamcons/BACKUP/system-backup.img.gz"




#SYSTEM

# If there is no file modified under 30 days to be found
if [[ ! $(find "$BACKUPIMAGE" -mtime -30 > /dev/null 2>&1 ) ]] ; then

                # Save to specified place a gzipped backup
                pkexec bash -c     "dd if=/dev/nvme0n1p2 bs=64k | gzip -c > $BACKUPIMAGE"


                # Nice notif
                notify-send "Stellas backup thingie" "System backed up!" --icon face-cool

fi


# restore with
# sudo bash -c "gunzip -c /media/teamcons/BACKUP/system-backup.img.gz | dd of=/nvme0n1p1 bs=32m"
# When in liveusb, saved img is right there 
# sudo bash -c "gunzip -c ./system-backup.img.gz | dd of=/nvme0n1p1 bs=32m"


