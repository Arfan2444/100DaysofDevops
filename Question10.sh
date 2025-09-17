Question 10 : We had to create a bash script official_backup.sh on App Server 3 to back up a website and copy it to the Nautilus Backup Server. The tasks:

1. Create a zip archive of /var/www/html/official.
2. Save the archive in /backup on App Server 3.
3. Copy it to /backup on Nautilus Backup Server.
4. Ensure no password prompt during copying (SSH keys).
5. No sudo inside the script.

Step by Step Solution:

Step 1: Connect to App Server 3
$ ssh banner@stapp03

Step 2: Create Script directory
$ mkdir -p /scripts

Step 3: Create script file
$ vi /scripts/official_backup.sh

Step 4: Write the script
#!/bin/bash

# Variables
SRC_DIR="/var/www/html/official"
BACKUP_NAME="xfusioncorp_official.zip"
LOCAL_BACKUP_DIR="/backup"
REMOTE_USER="clint"
REMOTE_HOST="stbkp01"
REMOTE_DIR="/backup"

# Ensure local backup dir exists
mkdir -p "$LOCAL_BACKUP_DIR"

# Step a: Create a zip archive of the source directory
zip -r "${LOCAL_BACKUP_DIR}/${BACKUP_NAME}" "$SRC_DIR"

# Step b: Copy archive to Nautilus Backup Server
scp "${LOCAL_BACKUP_DIR}/${BACKUP_NAME}" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}/"


Step 5: Make the script executable
$ chmod +x /scripts/official_backup.sh

Step 6: Install the zip
$ sudo yum install -y zip

Step 7: Generate SSH key on App Server 3
$ ssh-keygen -t rsa

Step 8: Copy key to Backup Server
$ ssh-copy-id clint@stbkp01

Step 9: Run the script
$ /scripts/official_backup.sh


Final Answer Summary 

1. Connect to App Server 3.
2. Create /scripts/official_backup.sh.
3. Add bash code to zip website → save in /backup → copy to Nautilus Backup Server.
4. Make script executable with chmod +x.
5. Install zip manually.
6. Generate SSH key and copy to Nautilus Backup Server for passwordless transfer.
7. Run the script to complete the backup.