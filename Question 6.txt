Question 6: Create a cronjob on each appserver
The Nautilus system admins team has prepared scripts to automate several day-to-day tasks. They want them to be deployed on all app servers in Stratos DC on a set schedule. Before that they need to test similar functionality with a sample cron job. Therefore, perform the steps below:
a. Install cronie package on all Nautilus app servers and start crond service.
b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user.

Solution:

Step 1 Connect to jumphost
    $  ssh thor@jump_host.stratos.xfusioncorp.com

Step 2 Connect to App Server
    $  ssh tony@stapp01.stratos.xfusioncorp.com
    $  sudo su -

Step 3 Install cronie Package
    $  yum install -y cronie

Step 4 Start and Enable Crond Service
    $  systemctl start crond
    $  systemctl enable crond
    $  systemctl status crond

Step 5 Edit the root crontab and add cron task line with schedule
    $  crontab -e
       */5 * * * * echo hello > /tmp/cron_text 

Step 6 Verify the setup
    $  crontab -l

Repeat step 2 to step 6 for all three app servers


🧠 Memory Tip:
CRIS" Method for Cron Tasks:

Connect to all servers
Run installation (cronie package)
Initiate service (start crond)
Schedule job (add to crontab)
Verify file and logs