# pictureframe

Rudimentary raspberry Pi picture-frame driver

### Raspberry Pi setup

format SD card with "SD Formatter" (32GB and under) or "FAT32 Format" for > 32GB

download Raspberry Pi Imager from raspberrypi.org/downloads

image Raspberry Pi OS to SD card

enable sshd from GUI (Preferences/Interfaces?)





### PictureFrame setup

Will need picture collection(s) to share on /mnt/pictureframe
each collection in its own subdirectory

Docs below include starting rclone in order to sync picture
collections down from google drive

install feh for image support and rclone to sync data from google drive
```
sudo apt-get install feh rclone
```

setup dir for pictureframe collections
```
mkdir /mnt/pictureframe
```

configure (google/read-only/no special settings - or any other cloud storage)
```
rclone config
```

turn off x-windows screensaver by
```
sudo nano /etc/lightdm/lightdm.conf
```

and add this line in [Seat]
```
xserver-command=X -s 0 -dpms
```

also do
```
sudo nano /etc/xdg/lxsession/LXDE-pi/autostart
```

and add at bottom
```
@xset s off
@xset -dpms
@xset s noblank
```

clone repo and put start and stop scripts in path

then add to startup routine
```
sudo nano /etc/rc.local
```

by adding this (lets wait a good long time, raspberry pi is slow)
```
sleep 30
start-pictureframe.sh personal # (or your default collection name)
```

setup cron to sync your collections if you're using glone
or something that needs scheduling:
add entry - every 15 min 24/7 or your own schedule
```
crontab -e
```

