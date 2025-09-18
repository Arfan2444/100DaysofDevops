Question 13:
One of our websites is running on the Nautilus app servers, and currently Apache is listening on port 3003. The security team has raised a concern that port 3003 is open to all hosts since no firewall rules are in place. To secure the setup, we need to install iptables on each application server, configure it so that port 3003 is accessible only from the Load Balancer host (stlb01 - 172.16.238.14), block it for all other incoming traffic, and ensure these rules persist even after a system reboot.

Solution:

Step 1 : Connect to AppServer 1
$ ssh tony@stapp01.company.com

Step 2 : Install iptables
$ sudo yum install iptables-services -y

Step 3 : Add Firewall rules
$ sudo iptables -A INPUT -p tcp -s 172.16.238.14 --dport 3003 -j ACCEPT (Allow port 3003 only from LBR host)
$ sudo iptables -A INPUT -p tcp --dport 3003 -j DROP

Step 4 : Save the rules
$ sudo service iptables save
$ sudo systemctl enable iptables
$ sudo systemctl start iptables

Step 5 : Verify
$ sudo iptables -L -n


💡 Logic Behind the Solution
Why iptables? → It controls incoming/outgoing traffic at the host level.
Why allow LBR only? → Security: Only load balancer should forward user traffic to app servers.
Why save rules? → Otherwise, firewall resets after reboot and leaves servers exposed.



Note : 
$ sudo iptables -A INPUT -p tcp -s 172.16.238.14 --dport 3003 -j ACCEPT
🔹 sudo → Run the command with root privileges (needed for firewall changes).
🔹 iptables → The Linux firewall utility.
🔹 -A INPUT → Append (-A) a rule to the INPUT chain (traffic coming into the server).
🔹 -p tcp → Match packets using the TCP protocol.
🔹 -s 172.16.238.14 → Match packets coming from source IP 172.16.238.14 (our Load Balancer).
🔹 --dport 3003 → Match packets targeting destination port 3003 (Apache port).
🔹 -j ACCEPT → The action (jump target) → ACCEPT packets that match.