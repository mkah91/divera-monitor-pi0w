# divera-monitor-pi0w

Show divera monitor on Raspberry Pi Zero W

## Step 1. Setup Raspberry Pi Image
- Use [Raspberry Pi Imager](https://www.raspberrypi.com/software/) to install 'Raspberry Pi Os Lite (Legacy)' on your SD card.
- Open the advanced settings:
  - Enable SSH and set a username and a password
  - Optional: configure WiFi (you could also do it in [Step 2](./README.md/#Step-2.-Set-startup-settings))

## Step 2. Set startup settings
- Connect to your pi via ssh with `ssh pi@<hostname>.local`
- Use `sudo raspi-config` and:
  - Activate `Console Autologin` (System Options, Boot Login)
  - Optional: configure WiFi settings
- Reboot with `sudo reboot`

## Step 3. Install GUI and Browser
- Connect to your pi again via ssh with `ssh pi@<hostname>.local`
- Run `./setup.sh`

## Step 4. Edit openbox autostart
- Edit the openbox autostart file via `sudo nano /etc/xdg/openbox/autostart`
  - Insert the content of the `start-divera-monitor.sh` file and save
- Edit the openbox environment file via `sudo nano /etc/xdg/openbox/environment`
  - Insert your URL as an environment variable like this: `export MONITOR_URL=<your-url>` and save

## Step 5. Start x server on startup
- Create or edit your `.bash_profile` via `sudo nano ~/.bash_profile`
  - Add this line `[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx -- -nocursor` and save
- Optional: to add a reboot every day use `sudo crontab -e` and add e.g. this line `0 6 * * * /sbin/shutdown -r now` (restarts at 6 a.m. every day)
- Reboot with `sudo reboot`

