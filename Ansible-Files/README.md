## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![ELK-STACK-Diagram](./Images/ELK-STACK.PNG)

These files been tested and verify and used to generate a live ELK Stack deployment within Azure. They can also be used to either recreate the entire deployment pictured above. And also maybe select portions of the yml files may be used to install only certain pieces of it, such as Filebeat.

dvwa-playbook.yml used to install DVWA Webservers.

elk-playbook.yml used to install ELK Stack Server.

filebeat-config.yml Filebeat service configuration modified and copied to the webservers as filebeat.yml.

filebeat-playbook.yml used to install Filebeat Syslog Service on webservers.

metricbeat-config.yml Metricbeat service configuration modified and copied to the webserver as metricbeat.yml.

metricbeat-playbook.yml used to install Metricbeat service on webservers

This document contains the following details:

Description of the Topology
Access Policies
ELK Configuration
Beats in Use
Machines Being Monitored
How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures the web application is available across multiple web application servers restricting unwanted or unecessary access to the Internet. A Load Balancers also may mitigate some DoS attacks as it can balance the load across many web application servers. Typically load balancers include a health probe to check all of the servers in its pool are functioning appropriately before sending traffic to them or it will stop sending traffic to missing or poor performing servers providing better uptime for the web application.

A Jump Box is similar to a gateway router as it becomes a single point of a protected network exposed to the public network as it sits in front of the other machines that are not exposed to the Internet. To further control access only specified IP addresses and port 22 are allowed access to the Jump Box. To avoid the username and password weakness of SSH we used asynchronous encryption keys to ensure a higher degree of protection than usernames and passwords.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the machine metrics and system logs.

Filebeat is used to capture system logs or file locations you specify then sending data to the ELK Server for indexing and review.

Metricbeat is used to capture machine metrics on Linux, Windows, and Mac hosts then forwarding to the ELK Server to track system level CPU usage, memory, file system, disk I/O, and network I/O metricbeat

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| AFIRIN44 |Worstation|24.118.22.58| WINDOWS 10       |
|Jump Box  | Gateway  | 10.0.0.4   | Linux UBUNTU 18.4|
| WEB-1    | DVWA     | 10.0.0.5   | LINUX UBUNTU 18.4|
| WEB-2    | DVWA     | 10.0.0.6   | LINUX UBUNTU 18.4|
| WEB-3    | DVWA     | 10.0.0.7   | LUNUX UBUNTU 18.4|

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the _____ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_

Machines within the network can only be accessed by _____.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses  |
|----------|---------------------|---------------------- |
| AFIRIN   | YES                 |10.0.0.0/16 10.1.0.0/16| 
| Jump Box | Yes                 |10.0.0.0/16 10.1.0.0/16|
| WEB-1    | NO                  |10.0.0.0/16 10.1.0.0/16|
| WEB-2    | NO                  |10.0.0.0/16 10.1.0.0/16|
| WEB-3    | NO                  |10.0.0.0/16 10.1.0.0/16| 
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

### Answer
its simplifys deployment from the central location that can be used to expand or redeploy the ELK Stack just by running an Ansible playbooks.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._

### Answer

- The playbook implements the following tasks:
- First I Install Docker, Python, and the Docker Module.
- Then I Configure the ELK Server memory.
- After that I Download Docker ELK Container and configure it.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Running-Docker-ps](./Images/Docker-ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
## Answer

- **10.0.0.5**
- **10.0.0.6**
- **10.0.0.7**

I have installed the following Beats on these machines:
## Answer

- **Filebeat**
- **Metricbeat**

These Beats allow us to collect the following information from each machine:
## Answer

- System log and application log details which include Web Traffic is gathered by Filebeat.
- CPU, Memory, Disk, Network, and other top-like statics are gathered with Metricbeat.

### Using the Playbook
In order to use the playbook, I will need to have an Ansible control node already configured, Ansible control node on the jump box  

SSH into the control node and follow the steps below:
- Copy the configuration file to the /etc/ansible/files/ to make configuration changes.
- Update the /etc/ansible/hosts file to include the targeted machine or machines.
- Create the <role>-playbook.yml file with the required tasks to be run by ansible-playbook.
- Run the playbook then navigate to the ELK Server Kibana data installation page to check the Module status that the installation worked as expected.

then Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?

### Answers

- Ansible playbook files were <role>-playbook.yml files located on the Jump Server within the Ansible Docker container in the /etc/ansible/roles/ folder.

- To update specific machines we edited the /etc/ansible/hosts by ensuring the [header] element is not commented out with a # or needs to be created then the hostname/IP of the machines are added to the file for Ansible to target groups of machines.

- Navigating to <http://104.210.155.66/app/kibana> successfully ensures the ELK Server is running and is ready for use.

## Commands I used to install  ELK Stack, Filebeat, and Metricbeat

- first I Install the ELK Stack on the elk server.
- then Connected to the Jump Box and attach to the Ansible container
- SSH into the Jump-Box by using ssh sysadmin@137.135.107.66

- Locate the container name:

Azureuser@Jump-Box-Provisioner:~$ sudo docker container list -a
CONTAINER ID   IMAGE                          COMMAND                  CREATED       STATUS                   PORTS     NAMES
34a0f498a3fc   cyberxsecurity/ansible         "/bin/sh -c /bin/bas…"   2 weeks ago   Exited (0) 4 hours ago             festive_wiles

- Start the container:

Azureuser@Jump-Box-Provisioner:~$ sudo docker container start festive_wiles
root@56b542ca508c:~#

- Attach (connect) to the Ansible container: festive_wiles

Azureuser@Jump-Box-Provisioner:~$ sudo docker container attach festive_wiles
root@56b542ca508c:~#

### Update the Ansible hosts file and create yml playbook file

Add the ELK Server IP address to the Ansible /etc/ansible/hosts file creating an [elk] section with the IP address:

- Open hosts file:

root@56b542ca508c:~# nano /etc/ansible/hosts

Add the [elk] section followed by the ELK Server IP address:

[elk]

10.1.0.4

Create the Ansible playbook used to install and configure elk container on  ELK Server virtual machine.

- root@56b542ca508c:~# nano /etc/ansible/roles/elk-playbook.yml

ELK install and the configuration tasks can be seen in the elk-playbook.yml playbook to automate ELK Stack deployment.

Exit nano and save the playbook.

### Running the Playbook and testing the results

- Run the Ansible playbook:

root@56b542ca508c:/etc/ansible/roles# ansible-playbook elk-playbook.yml

PLAY [Configure Elk VM with Docker] ****************************************************

TASK [Gathering Facts] *****************************************************************
ok: [10.1.0.4]

TASK [Install docker.io] ***************************************************************
changed: [10.1.0.4]

TASK [Install python3-pip] *************************************************************
changed: [10.1.0.4]

TASK [Install Docker module] ***********************************************************
changed: [10.1.0.4]

TASK [Increase virtual memory] *********************************************************
changed: [10.1.0.4]

TASK [Increase virtual memory on restart] **********************************************
changed: [10.1.0.4]

TASK [download and launch a docker elk container] **************************************
changed: [10.1.0.4]

TASK [Enable service docker on boot] ***************************************************
changed: [10.1.0.4]

PLAY RECAP *****************************************************************************
10.1.0.4                   : ok=1    changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 


- ELK container is installed, SSH to your container and also double-check that my elk-docker container is running.


root@56b542ca508c:/etc/ansible/roles# ssh Azadmin@10.1.0.4
Azadmin@elk:~$ sudo docker ps
CONTAINER ID    IMAGE         COMMAND                  CREATED      STATUS         PORTS                                                                              NAMES
302324cc1367   sebp/elk:761   "/usr/local/bin/star…"   7 days ago   Up 2 minutes   0.0.0.0:5044->5044/tcp, 0.0.0.0:5601->5601/tcp, 0.0.0.0:9200->9200/tcp, 9300/tcp   elk
Azadmin@elk-server:~$

- the ELK server container is up and running.

**Navigate to http://52.175.211.238:5601/app/kibana to verify the ELK Stack is running**
**Use the public IP address of the ELK server from Azure.**

### Install the Filebeat on to the webserver virtual machines

First i Create the Filebeat Configuration File
Stay attached to the Ansible container on the Jump box.
then Install the ELK Stack on the elk server after that i  Connected to the Jump Box and attach to the Ansible container for steps to attach to the Ansible container.
then Copy filebeat-config.yml to the Ansible container.

root@56b542ca508c:/etc/ansible# curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/files/filebeat-config.yml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 73112  100 73112    0     0   964k      0 --:--:-- --:--:-- --:--:--  964k

I Edit the Filebeat configuration file to send Beat traffic to the ELK Stack container running on the ELK Server.
root@56b542ca508c:/etc/ansible# nano -l /etc/ansible/files/filebeat-config.yml

- In order To send data to the ELK Server I hvae to add IP addressto the filebeat-config.yml.
Scroll to line #1105 and set the IP address of the ELK server leaving the port :9200 in place.
Note that the default credentials are elastic:changeme and should be changed to the proper username and password

- I should look like something like this

output.elasticsearch:
hosts: ["10.1.0.4:9200"]
username: "elastic"
password: "changeme"

After that I Scroll to line #1805 to replace the IP address with the ELK Server's IP Address and leaving the port :5601 in place.

- it should look like something like this

setup.kibana:
host: "10.1.0.4:5601"

### Filebeat Installation Playbook file

- Download the .deb file from artifacts.elastic.co.
- Install the .deb file using the dpkg command shown below:
- dpkg -i filebeat-7.6.1-amd64.deb
- Copy the Filebeat configuration file from the Ansible container to webservers.
- Used the Ansible module copy to copy the entire configuration file into the correct place.
- Run the filebeat modules enable system command.
- Run the filebeat setup command.
- Run the service filebeat start command.
- Enable the Filebeat service on boot.

Then I Build the playbook from the task overview using nano, Ansible, and Eleastic documentation.

root@56b542ca508c::~# nano /etc/ansible/roles/filebeat-playbook.yml

Filebeat install and configuration tasks will be  in the filebeat-playbook.yml playbook to automate the deployment of Filebeat.

### Running the Filebeat playbook

root@56b542ca508c:/etc/ansible# ansible-playbook /etc/ansible/roles/filebeat-playbook.yml

PLAY [Installing and Launching Filebeat] *******************************************************

TASK [Gathering Facts] *************************************************************************
ok: [10.0.0.5]
ok: [10.0.0.6]
ok: [10.0.0.7]

TASK [Download filebeat .deb file] *************************************************************
[WARNING]: Consider using the get_url or uri module rather than running 'curl'.  If you need to
use command because get_url or uri is insufficient you can add 'warn: false' to this command
task or set 'command_warnings=False' in ansible.cfg to get rid of this message.

changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

TASK [Install filebeat .deb] ********************************************************************
changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

TASK [Drop in filebeat.yml] ********************************************************************
ok: [10.0.0.5]
ok: [10.0.0.6]
ok: [10.0.0.7]

TASK [Enable and Configure System Module] ******************************************************
changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

TASK [Setup filebeat] **************************************************************************
changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

TASK [Start filebeat service] ******************************************************************
[WARNING]: Consider using the service module rather than running 'service'.  If you need to use
command because service is insufficient you can add 'warn: false' to this command task or set
'command_warnings=False' in ansible.cfg to get rid of this message.

changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

TASK [Enable service filebeat on boot] **************************************************************************
changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

PLAY RECAP *************************************************************************************
10.0.0.5                  : ok=7    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
10.0.0.6                  : ok=7    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
10.0.0.7                   : ok=7    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

- playbook ran successfully as there were no unreachable, failed, skipped, rescues or ignored

- to Verifying Filebeat Installation

Go to the Kibana website http://104.210.155.66:5601/app/kibana to verify that the ELK Stack is running and receiving data.
Click on Add Log Data.
Choose System Logs.
Click on the DEB tab under Getting Started where you will see the Linux Filebeat installation instructions.
Scroll Module status and click Check Data to ensure we get a check by the Module status.

![Installation-filebeat](./Images/filebeat.png)

I Scroll to the bottom and click on System logs dashboard to see Kibana presenting System Log data.

![Filebeat-system-log](./Images/filebeat-dashboard.png)

### Installing Metricbeat on the webserver virtual machines

I Create the Metricbeat Configuration File
Stay attached to the Ansible container on the Jump box.
i also Install the ELK Stack on the elk server then i Connected to the Jump Box and attach to the Ansible container for steps to attach to the Ansible container.
After that i Copy metric-config.yml to the Ansible container.

root@56b542ca508c:/etc/ansible# curl https://gist.githubusercontent.com/slape/58541585cc1886d2e26cd8be557ce04c/raw/0ce2c7e744c54513616966affb5e9d96f5e12f73/metricbeat > /etc/ansible/files/metricbeat-config.yml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
 00  6188  100  6188    0     0  21337      0 --:--:-- --:--:-- --:--:-- 21337


I edit the Metricbeat configuration file to send Beat traffic to the ELK Stack container running on the ELK Server.

root@56b542ca508c:/etc/ansible# nano -l /etc/ansible/files/metricbeat-config.yml

- in order send data to the ELK Server the IP address must be added to the metricbeat-config.yml.
i Scroll to line #62 and set the IP address of the ELK Server leaving the port :5601 in place.

- it should look like this

setup.kibana:
host: "10.1.0.4:5601"

- Scroll to line #95 to set the IP of the ELK Server leaving the port :9200 in place.

- it should look like this 

output.elasticsearch:
hosts: ["10.1.0.4:9200"]
username: "elastic"
password: "changeme"

### Create and run the Metricbeat Installation Playbook file

sometimes formatting differences are likely to occur and will probly  corrupt configuration file.

Overview of the playbook tasks performed on the webservers:

- Download the Metricbeat .deb file.
- Install the .deb file using the dpkg command shown below:
   - dpkg -i metricbeat-7.6.1-amd64.deb
- Copy the Metricbeat configuration file from the Ansible container to webservers.
- Used the Ansible module copy to copy the entire configuration file into the correct place.
- Run the metricbeat modules enable docker command.
- Run the metricbeat setup command.
- Run the service metricbeat start command.
- Enable the Metricbeat service on boot.

- Build the playbook from the task overview using nano, Ansible, and Eleastic documentation.

root@56b542ca508c:~# nano /etc/ansible/roles/metricbeat-playbook.yml

- Metricbeat install and configuration tasks can be seen in the metricbeat-playbook.yml playbook to automate the deployment of Metricbeat.

### Running the Metricbeat playbook

root@56b542ca508c:/etc/ansible/roles# ansible-playbook metricbeat-playbook.yml

PLAY [Install metric beat] **************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************
ok: [10.0.0.5]
ok: [10.0.0.6]
ok: [10.0.0.7]

TASK [Download metricbeat] **************************************************************************************************
changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

TASK [Install metricbeat] ***************************************************************************************************
changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

TASK [Drop in metricbeat config] ********************************************************************************************
changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

TASK [Enable and configure docker module for metric beat] *******************************************************************
changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

TASK [Setup metric beat] ****************************************************************************************************
changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

TASK [Start metric beat] ****************************************************************************************************
changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

TASK [Enable service metricbeat on boot] ************************************************************************************
changed: [10.0.0.5]
changed: [10.0.0.6]
changed: [10.0.0.7]

PLAY RECAP ******************************************************************************************************************
10.0.0.5                   : ok=8    changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
10.0.0.6                   : ok=8    changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
10.0.0.7                   : ok=8    changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
 rescued=0    ignored=0

- playbook ran successfully and there was no unreachable, failed, skipped, rescued, or ignored issues.

### Verifying Metric Beat Installation

- Go to the Kibana website http://52.175.211.238:5601/app/kibana to verify that the ELK Stack is running and receiving data.
- Click Add Metric Data.
- Click Docker Metrics.
- Click the DEB tab under Getting Started where you will see Linux Metricbeat instructions.
- Scroll Module status and click Check Data to ensure we get a check by the Module status.


![Installation-metricbeat](./Images/metricbeat.png)

- Scroll to the bottom and click on Docker metrics dashboard.

![Installation-metricbeat-system-log](./Images/metricbeat-dashboard.png)

- Metricbeat was successfully sending data to the ELK stack the screenshots above

created by Abdisalan M Firin