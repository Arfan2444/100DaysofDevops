Question 5: SELinux Setup

Following a security audit, the xFusionCorp Industries security team has opted to enhance application and server security with SELinux. To initiate testing, the following requirements have been established for App server 2 in the Stratos Datacenter:
1. Install the required SELinux packages.
2. Permanently disable SELinux for the time being; it will be re-enabled after necessary configuration changes.
3. No need to reboot the server, as a scheduled maintenance reboot is already planned for tonight.
4. Disregard the current status of SELinux via the command line; the final status after the reboot should be disabled.

Solution:

Step 1: Login to jumphost
  $ ssh thor@jump_host.stratos.xfusioncorp.com

Step 2: Login to App Server 2
  $ ssh steve@stapp02.stratos.xfusioncorp.com

Step 3: Switch to root
  $ sudo su -

Step 4: Install Linux Packages
  $ yum install -y selinux-policy selinux-policy-targeted policycoreutils

Step 5: Permanently disable SELinux
  $ vi /etc/selinux/config
 
   SELINUX = disabled

Step 6: Verify the config file
  $ grep SELINUX = /etc/selinux/config



Memory Tip 🧠
👉 To remember SELinux states:
Enforcing = “Strict Police” 👮 (blocks everything not allowed).
Permissive = “CCTV Mode” 📹 (just logs violations, doesn’t block).
Disabled = “Police on vacation” 🌴 (no checking at all).