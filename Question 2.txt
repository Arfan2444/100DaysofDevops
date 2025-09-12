Question 2
Create a user named mark on App Server 3 in Stratos DC.
Set the expiry date to 2023-12-07.
(Important: Username must be lowercase.)

Solution:
1. Login to Jump Host
ssh thor@jump_host.stratos.xfusioncorp.com

2. Login to App Server 3
ssh banner@172.16.238.12

3. Create a user mark with expiry date
sudo useradd -e 2023-12-07 mark

4. Verify the expiry date
sudo chage -l mark

Expected output:
Account expires : Dec 07, 2023

Easy Memory Tip

Think of it as:
👉 Login → Login → useradd -e → chage -l

-e = expiry date

chage -l = check expiry
