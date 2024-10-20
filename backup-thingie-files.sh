#!/bin/bash

WHERE="/media/teamcons/BACKUP/"
cd "$WHERE"

BACKUPFOLDER="./slashhomeslashteamcons"
LOG="./backup-rsync.log"
LOG2="./backup-rsync-previous.log"

BACKUPIMAGE="./system-backup.img.gz"






# If the log is older than 30 days
# Could do without an IF, but theres no point in agressively backing up every smol change
# And boinging useless writes to an already old SSD

if [[ ! $(find "$LOG" -mtime -30 >> /dev/null) ]] ; then

        # Keep previous log
        cat $LOG > $LOG2



        # Lets goooo
        rsync -vir --delete --exclude=".*" --exclude="pCloudDrive" --exclude="Appimages" \
                        /home/teamcons/           \
                        "$BACKUPFOLDER"            \
                        | grep  --line-buffered -v 'is uptodate' | tee $LOG


        # yooooo
        notify-send "Stellas backup thingie" "Files backed up!" --icon face-cool

fi


exit

##########

#SYSTEM

# If there is no file modified under 30 days to be found
if [[ ! $(find "$BACKUPIMAGE" -mtime -30 >> /dev/null) ]] ; then

                # Save to specified place a gzipped backup
                pkexec bash -c     "dd if=/nvme0n1p1 bs=32m | gzip -c > $BACKUPIMAGE"


                # Nice notif
                notify-send "Stellas backup thingie" "System backed up" --icon face-cool
                
                
fi


# restore with
# sudo bash -c "gunzip -c /media/teamcons/BACKUP/system-backup.img.gz | dd of=/nvme0n1p1 bs=32m"
# When in liveusb, saved img is right there 
# sudo bash -c "gunzip -c ./system-backup.img.gz | dd of=/nvme0n1p1 bs=32m"


