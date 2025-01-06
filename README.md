# Automatic Update and Upgrade Script with Reboot

This script automatically updates and upgrades the Linux distro system using Apt. It checks if a reboot is required after upgrading and, if necessary, reboots the system.

### Features
- **Daily updates**: Runs `apt update` and `apt full-upgrade`.
- **Cleanup**: Removes obsolete packages to save space.
- **Automatic reboot**: Reboots the system if a reboot is required.
- **Automatic cron job**: Checks and adds a daily cron job if it’s not already present, running the script every day at midnight.

---

## Prerequisites
- Linux Distro (tested on Debian 12).
- `git` installed to clone the repository (if not, install with `sudo apt install git`).
- Administrator privileges for installation and execution.

## Installation

1. **Clone the repository from GitHub**:

   ```bash
   git clone https://github.com/Emilca1/Apt-auto-script.git
2. **Navigate to the cloned directory**:
   ```bash
   cd Apt-auto-script
3. **Move the script to you're prefered location (mine is /usr/local/bin/)**
   ```bash
   sudo mv update-upgrade.sh /usr/local/bin/
4. **Set execute permission for the script**
   ```bash
   sudo chmod +x /usr/local/bin/update-and-upgrade.sh

## Additionnal information

**The cron job added is** :
   ```bash
   0 0 * * * /usr/local/bin/update-and-upgrade.sh >> /var/log/auto-upgrade.log 2>&1
   ```
   **Check the logs** :
   ```bash
    tail -f /var/log/auto-upgrade.log
