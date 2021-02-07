## **Automated ELK Stack Deployment**

The files in this repository were used to configure the network depicted below.

**Note**: The following image link needs to be updated. Replace diagram_filename.png with the name of your diagram image file.

![](Diagrams/Screenshot%202021-02-04%2016.33.27.png)

![alt_text](images/image1.png "image_tooltip")


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the “ansible playbook elk.yml” file may be used to install only certain pieces of it, such as Filebeat.



     ---
     - name: Config elk Vm with Docker_
       hosts: elk_
       become: True_
       tasks:_
         - name: Set the vm.max_map_count to 262144 in sysctl_
           sysctl: name={{ item.key }} value={{ item.value }}_
           with_items:_
             - { key: "vm.max_map_count", value: "262144" }_
   
         - name: docker.io_
           apt:_
             force_apt_get: yes_
             update_cache: yes_
             name: docker.io_
             state: present_
   
         - name: Install pip3_
           apt:_
             force_apt_get: yes_
             name: python3-pip_
             state: present_
    
         - name: Install Docker python module_
           pip:_
             name: docker_
             state: present_
    
         - name: download and launch a docker web container_
           docker_container:_
             name: elk_
             image: sebp/elk:761_
             state: started_
             restart_policy: always_
             published_ports:_
               - 5601:5601_
               - 9200:9200_
               - 5044:5044_
   
         - name: Enable docker service_
           systemd:_
             name: docker_
             enabled: yes_
   
   

This document contains the following details:



*   Description of the Topology
*   Access Policies
*   ELK Configuration
    *   Beats in Use
    *   Machines Being Monitored
*   How to Use the Ansible Build


### **Description of the Topology**

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly responsive, in addition to restricting traffic to the network.



*   _TODO: What aspect of security do load balancers protect?_

    _By protecting against DDOS attacks by shifting attack traffic , the load balancer potects the availability of the network. _

*   _What is the advantage of a jump box?_

    _Jump Boxes enable updates of a whole networks machines to be updated simultaneously through one system update._


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _____ and system _____.



*   _TODO: What does Filebeat watch for? Log files and locations and collects log events_
*   _TODO: What does Metricbeat record? Takes the metrics and statistics and ships them to a specified output i.e. elasticsearch or logstash_

The configuration details of each machine may be found below. _Note: Use the[ Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.


<table>
  <tr>
   <td><strong>Name</strong>
   </td>
   <td><strong>Function</strong>
   </td>
   <td><strong>IP Address</strong>
   </td>
   <td><strong>Operating System</strong>
   </td>
  </tr>
  <tr>
   <td>Jump Box
   </td>
   <td>Gateway
   </td>
   <td>10.2.0.4
   </td>
   <td>Linux
   </td>
  </tr>
  <tr>
   <td>Webvm-1
   </td>
   <td>Server
   </td>
   <td>10.2.0.7 
   </td>
   <td>Linux
   </td>
  </tr>
  <tr>
   <td>Webvm-2
   </td>
   <td>Server
   </td>
   <td>10.2.0.8
   </td>
   <td>Linux
   </td>
  </tr>
  <tr>
   <td>ElkStack
   </td>
   <td>Server
   </td>
   <td>10.3.0.4
   </td>
   <td>Linux
   </td>
  </tr>
</table>



### **Access Policies**

The machines on the internal network are not exposed to the public Internet.

Only the Whitelisted IP_and the ELK____ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:



*   _TODO: Add whitelisted IP addresses_

    _Your Home IP Address and [Your ELK STACK VM Public IP](https://portal.azure.com/#)_


Machines within the network can only be accessed by Single Server/ssh_____.



*   _TODO: Which machine did you allow to access your ELK VM? What was its IP address? Whitelisted IP Machines . \_
*   _The Jump Box 10.2.0.4_

A summary of the access policies in place can be found in the table below.


<table>
  <tr>
   <td><strong>Name</strong>
   </td>
   <td><strong>Publicly Accessible</strong>
   </td>
   <td><strong>Allowed IP Addresses</strong>
   </td>
  </tr>
  <tr>
   <td>Jump Box
   </td>
   <td>Yes
   </td>
   <td> HOME IP ADDRESS
   </td>
  </tr>
  <tr>
   <td>WEB-1
   </td>
   <td>no
   </td>
   <td>10.2.0.4
   </td>
  </tr>
  <tr>
   <td>WEb-2
   </td>
   <td>no
   </td>
   <td>10.2.0.4
   </td>
  </tr>
</table>

### ** **Elk Project   no                           10.2.0.4


### **Elk Configuration**

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...



*   _TODO: What is the main advantage of automating configuration with Ansible? Ansible enables automation of tasks which frees the IT personnel from daily, weekly, monthly tasks that need to be done.  It also reduces likelihood of human error_

The playbook implements the following tasks:



*   _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
*   Install Docker
*   start and attach Docker
*   Install Pip3
*   Download the image
*   Install docker
*   Modify the configuration file
*   Command: sysctl -w vm.max_map_count=262144
*   Write YML file
*   Enable the Docker + Launch docker container:elk

    

The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.


![](Diagrams/Screenshot%202021-01-27%2018.13.29.png)


**Target Machines & Beats**

This ELK server is configured to monitor the following machines:



*   _TODO: List the IP addresses of the machines you are monitoring: JUMPBOX: 10.3.0.4_

We have installed the following Beats on these machines:



*   _TODO: Specify which Beats you successfully installed: FILEBEAT_

These Beats allow us to collect the following information from each machine:



*   _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., Winlogbeat collects Windows logs, which we use to track user logon events, etc._

    _Filebeat collects log events and forwards them to Elasticsearch for indexing. This then is sent over to the output which is Kibana. _



### **Using the Playbook**

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:



*   Copy the _filebeat configuration____ file to _/etc/ansible/roles____.
*   Update the _filebeat_config.yml____ file to include..elk webserver.
*   Run the playbook, and navigate to __Kibana__ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_



*   _Which file is the playbook? Where do you copy it? Roles, _
*   _Which file do you update to make Ansible run the playbook on a specific machine?_

    _filebeat_config.yml_

*   _ How do I specify which machine to install the ELK server on versus which to install Filebeat on? Add the elk webserver IP_
*   _Which URL do you navigate to in order to check that the ELK server is running? http://http://public Ip of elk server VM/:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

_Nano filebeat-playbook.yml_

_Ansible-playbook filebeat.yml_
