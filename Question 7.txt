💡 Task:
 Set up password-less SSH access so the orchestrator user on the jump host can run scripts on all app servers without being prompted for a password (using SSH key generation).

✍️ Solution / Concept:
Step 1: Connect to jumphost:
 $ ssh username@jumhost.company.com

Step 2: Generate an ssh key on jumphost:
 $ ssh-keygen -t rsa

Step 3: Copy the Public key to all app servers:
 $ ssh-copy-id user1@stapp01.company.com
 $ ssh-copy-id user2@stapp02.company.com
 $ ssh-copy-id user3@stapp03.company.com

Step 4: Verify Password-less Access
 try logging into each appserver using jumphost
 it should connect directly without password prompt

🔑 Logic Behind This Setup:
1. SSH keys replace passwords for authentication.
2. Private key stays safe on the jump host.
3. Public key is added to each server’s authorized keys.
4. On login, the server matches keys → if they match, access is granted without password.
