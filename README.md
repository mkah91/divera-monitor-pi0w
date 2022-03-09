# divera-monitor-pi0w

Show a [DIVERA](https://www.divera247.com/) monitor on Raspberry Pi Zero W. Due to only having 512 MB of RAM a Raspberry Pi Zero W is not really suitable to browse the web. That's why a setup as suggested [here](https://github.com/Dustin1358/Raspberry-Pi-Divera-Monitor) will most likely not work. Therefore, it is necessary to only setup the things that are really needed and e.g. do not use a full-blown Raspberry Pi OS with a desktop environment.

## Step 1. Setup Raspberry Pi
- Use [Raspberry Pi Imager](https://www.raspberrypi.com/software/) to install 'Raspberry Pi OS Lite (Legacy)' on your SD card.
- Open the advanced settings:
  - Set a hostname for you pi 
  - Enable SSH and set a username and a password
  - Optional, but prefered: configure WiFi (you could also do it in [Step 2](./README.md/#Step-2.-Set-startup-settings))
- Put the SD card into the pi and connect a display via HDMI.

## Step 2. Adapt Rasberry Pi Configuration
- Connect to your pi via ssh with `ssh pi@<your-hostname>.local`
- Use `sudo raspi-config` and:
  - Activate `Console Autologin` (&#8594; System Options &#8594; Boot Login)
  - Optional: configure WiFi settings
- Reboot with `sudo reboot`

## Step 3. Install GUI and Chromium Browser
- Connect to your pi again via ssh with `ssh pi@<your-hostname>.local`
- Run `./setup.sh`

## Step 4. Edit Openbox (Window Manager) Autostart
- Edit the openbox autostart file via `sudo nano /etc/xdg/openbox/autostart`
  - Insert the content of the `start-divera-monitor.sh` file and save
- Edit the openbox environment file via `sudo nano /etc/xdg/openbox/environment`
  - Insert your URL as an environment variable like this: `export MONITOR_URL=<your-url>` and save

## Step 5. Start X Server on Startup
- Create or edit your `.bash_profile` via `sudo nano ~/.bash_profile`
  - Add this line `[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx -- -nocursor` and save
- Optional: to add a reboot every day use `sudo crontab -e` and add e.g. this line `0 6 * * * /sbin/shutdown -r now` (restarts at 6 a.m. every day)
- Reboot with `sudo reboot`

