Question 9:
The Nautilus application cannot connect to the database. On the DB server (stdb01) the mariadb service is failing to start. Find the cause and fix it so MariaDB runs and stays enabled.

Step 1 : Jump to Db Server
$ ssh userdb@x_stratos.company.com

Step 2: Check MariaDB status
$ systemctl status MariaDB

Step 3: Inspect MariaDB log
$ sudo cat /var/log/mariaDB/mariaDB.log
find the concrete error (we saw InnoDB error 13 = permission denied).

Step 4: Verify the ownership and Permission
$ ls -ld /var/lib/mysql
drwxr-x---  mysql mysql ... (it should be)

Step 5: Fix the Ownership
$ sudo chown -R mysql:mysql /var/lib/mysql 	1) chown - change owner   2) mysql:mysql - user:group it set owner user = mysql  3) var/lib/mysql - data dir where mariadb stores files 
$ sudo chmod 750 /var/lib/mysql			1) chmod - change mode    2) 750 - 7 owner has (r,w,x) 5 group has (r,x) 0 Others have no access

Step 6: Restart and enable Mariadb
$ systemctl start mariadb
$ systemctl enable mariadb
$ systemctl status mariadb


💡 Logic used:

MariaDB runs under the mysql user.
If datadir isn’t owned by mysql:mysql, the server can’t read/write → startup fails.
Fixing ownership + correct permissions gives MariaDB full access again.