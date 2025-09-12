Question:
Following security audits, the xFusionCorp Industries security team has rolled out new protocols, including the restriction of direct root SSH login.
Your task is to disable direct SSH root login on all app servers within the Stratos Datacenter.

Step-by-step Solution:

1. Login to the Jump Host
   ssh thor@jump_host.stratos.xfusioncorp.com
   # password: mjolnir123


2. Connect to each App Server (stapp01, stapp02, stapp03)
   Example for stapp01:
    ssh tony@stapp01.stratos.xfusioncorp.com
    # password: Ir0nM@n


	(Use the correct user & password from infra table for stapp02 and stapp03.)

3. Open SSH configuration file
   sudo vi /etc/ssh/sshd_config


4. Find the line
   PermitRootLogin yes
   and change it to:
   PermitRootLogin no


If the line is commented with #, remove the # and set it to no.

5. Save and exit the file
   In vi: press ESC, then type :wq and press Enter.

6. Restart the SSH service to apply changes
   sudo systemctl restart sshd


Repeat steps 2–6 for all three app servers:
stapp01 (user: tony / pass: Ir0nM@n)
stapp02 (user: steve / pass: Am3ric@)
stapp03 (user: banner / pass: BigGr33n)


7. Verify configuration
   Try logging in as root (it should fail now):
   ssh root@stapp01.stratos.xfusioncorp.com



Memory trick 
🔑 “Never go root directly — always go through the user.”

That means:
     Use app users (tony, steve, banner) + their password.
     Then run sudo su - for root tasks.
     Root login via SSH will always fail → that’s proof your config is correct.

