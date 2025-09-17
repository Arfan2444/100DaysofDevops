Question 12:
1. Free the port conflict (stop sendmail from occupying the wrong port).
2. Start and enable Apache (httpd) service on port 8086.
3. Update iptables firewall rules to allow incoming traffic on port 8086.

Step 1: Go to App Server 1
$ ssh tony@stapp.company.com

Step 2: Check the status of Apache service
$ sudo systemctl status httpd (output: Port is unavailable)

Step 3: Find out What is listening on the port
$ sudo netstat -tulnp | grep : $Port

Step 4: Stop the conflicting process using the port
$ sudo systemctl stop sendmail
$ sudo systemctl disable sendmail

Step 5: Start the Apache
$ sudo systemctl start httpd
$ sudo systemctl enable httpd

Step 6: Check the firewall rules
$ sudo iptables -L -n (Since the iptables is rejecting traffic)

Step 7: Allow the port on iptables
$ sudo iptables -I INPUT 4 -p tcp --dport $PORT -j Accept

Step 8: Verify on appserver and jumphost
$ curl http://localhost:$PORT

Logic in Short:
1. Service check first — if Apache is down, nothing else matters.
2. Port listen check — if Apache can't bind, it will fail; check which process currently owns the port.
3. Free/stop conflicting process — a port can only be used by one process. Stop the conflicting one or change its configuration.
4. Start Apache — once the port is free, Apache can bind and run.
5. Open the firewall — even if Apache listens, firewall rules can block external access.
6. Verify locally then remotely — confirm the site works locally (quick test) and then from jump host (real test).