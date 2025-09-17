Question 11:

1) Install Tomcat on App Server 2 (stapp02, user = steve).
2) Run Tomcat on port 8082 instead of default 8080.
3) Deploy ROOT.war (available on Jump Host /tmp) into Tomcat.
4) Verify app runs at base URL → curl http://stapp02:8082.


Solution:

Step 1: SSH into App Server
$ ssh steve@stapp02.company.com

Step 2: Install Tomcat on App Server 2
$ sudo yum install -y tomcat tomcat-webapps tomcat-admin-webapps

Step 3: Configure the tomcat port
$ sudo vi /usr/share/tomcat/conf/server.xml

Step 4: Find the section
<Connector port="8080" protocol="HTTP/1.1" ... /> change it to 8082

Step 5: Enable and Start tomcat server
$ sudo systemctl enable tomcat
$ sudo systemctl start tomcat
$ sudo systemctl status tomcat

Step 6: Transfer Root.war from Jump host to App Server
$ scp /tmp/Root.war steve@stapp02:/tmp/

Step 7: Deploy the Root.war to tomcat
$ sudo cp /tmp/Root.war /usr/share/tomcat/webapps/

Step 8: Restart Tomcat & Test the app
$ sudo systemctl restart tomcat
$ curl https://stapp02:8082


Final Answer Summary (Exam-Style)

1. Connect to App Server 2 (ssh steve@stapp02).
2. Install Tomcat (yum install -y tomcat).
3. Update port in server.xml from 8080 → 8082.
4. Start and enable Tomcat service.
5. Copy ROOT.war from Jump Host /tmp → App Server 2 → /usr/share/tomcat/webapps/.
6. Restart Tomcat.
7. Verify using curl http://stapp02:8082.
