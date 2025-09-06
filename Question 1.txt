Q1. Create a user named ammar with a non-interactive shell on App Server 2.

Solution:

1. Login to Jump Host:
   ssh thor@jump_host.stratos.xfusioncorp.com
   (password: mjolnir123)

2. From Jump Host, login to App Server 2:
   ssh steve@172.16.238.11
   (password: Am3ric@)

3. Create the user 'ammar' with non-interactive shell:
   sudo useradd -s /sbin/nologin ammar

4. Verify the user:
   getent passwd ammar

Expected output will show:
   ammar:x:UID:GID::/home/ammar:/sbin/nologin

🔹 Easy Way to Remember

ssh → jump host

ssh → app server

useradd -s /sbin/nologin username

getent passwd username

👉 Just think: Login → Login → Create → Check