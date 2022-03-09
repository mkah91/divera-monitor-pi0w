#!/bin/bash

# needed environment variables: MONITOR_URL

# Display settings
xset -dpms # turn off display power management system
xset s noblank # turn off screen blanking
xset s off # turn off screen saver

# Remove exit errors from the config files that could trigger a warning
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences

# Run Chromium in kiosk mode
chromium-browser  --noerrdialogs --disable-infobars --check-for-update-interval=31536000 --incognito --kiosk $MONITOR_URL
