Question 8:
Install ansible version 4.7.0 on Jump host using pip3 only. Make sure Ansible binary is available globally on this system, 
i.e all users on this system are able to run Ansible commands.

We need to install Ansible v4.7.0 on the jump host.
Installation must be done using pip3 only.
The ansible binary must be available system-wide (so all users can run it, not just thor).


Solution:

Step 1 : Connect to Jump Host
$ ssh thor@jump_host.stratos.xfusioncorp.com

Step 2 : Switch to root user
$ sudo su -

Step 3: Check if pip3 is installed
$ pip3 --version (yum install -y python3-pip)

Step 4: Install Ansible 4.7.0
$ pip3 install ansible==4.7.0

Step 5: Confirm Version
$ ansible --version


Memory Tip 🧠
👉 “pip3 + prefix → makes Ansible global.”

Use pip3 install ansible==4.7.0
Add --prefix=/usr/local for global
Verify with ansible --version