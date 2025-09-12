Question:
In a bid to automate backup processes, the xFusionCorp Industries sysadmin team has developed a new bash script named xfusioncorp.sh. While the script has been distributed to all necessary servers, it lacks executable permissions on App Server 3 within the Stratos Datacenter.

Your task is to grant executable permissions to the /tmp/xfusioncorp.sh script on App Server 3. Additionally, ensure that all users have the capability to execute it.

Solution:

1. Login to JumpHost
ssh thor@jump_host.stratos.xfusioncorp.com

2. SSH to App Server 3
ssh user3@stapp03.stratos.xfusioncorp.com

3. Check current permissions of the sh file
ls -l /tmp/xfusioncorp.sh

4. Add Read + Execute Permissions
sudo chmod 755 /tmp/xfusioncorp.sh (instead of 755 we can give a+x which provides only execute permission)

5. Verify the final perimission
ls -l /tmp/xfusioncorp.sh


Output should look like:
-rwxr-xr-x 1 root root 40 Sep  9 19:43 /tmp/xfusioncorp.sh


👉 For scripts, always remember:
+x = makes it executable only.
755 = makes it executable AND readable (safe for scripts).
