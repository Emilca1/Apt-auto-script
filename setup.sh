#!/bin/bash

#Install cron if not exist
sudo apt install cron -y

#Move the script to the binary location
sudo mv update-upgrade.sh /usr/local/bin/

#Set execute permission for the script
sudo chmod +x /usr/local/bin/update-upgrade.sh

#Execute the script to initialize it
bash /usr/local/bin/update-upgrade.sh