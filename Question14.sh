Task:
1. Identify the faulty app host and fix the issue.
2. Make sure Apache service is up and running on all app hosts.
3. Apache must be running on port 3004 on all app servers.
4. No need to worry about website code — just ensure service availability.

Solution:

Step 1: SSH into each app server from Jump Host
$ ssh user@app.company.com

Step 2: Check apache Service status
$ sudo systemctl status httpd

Step 3: Find which process is using that port
$ sudo netstat -tulnp | grep 3004

Step 4: Stop the conflicting the service
$ sudo systemctl stop sendmail
$ sudo systemctl disable sendmail

Step 5: Try to start and enable the service
$ sudo systemctl start httpd
$ sudo systemctl enable httpd

Step 6: Verify Apache is listening on port 3004
$ sudo netstat -tulnp | grep httpd

Logic Behind Solution:
- The error was caused because another service (Sendmail) was already using port 3004.
- Apache could not start since only one process can bind to a port at a time.
- Solution: Stop Sendmail (free the port) and start Apache.
- Then ensure firewall allows traffic on port 3004.
- Enabling httpd ensures service is persistent across reboots.
- Disabling sendmail prevents future conflicts.