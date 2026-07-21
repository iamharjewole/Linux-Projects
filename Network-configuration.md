# Network Configuration and Troubleshooting

## Objective: Learn how to configure and troubleshoot network settings in Linux

### Steps

- **Step 1: Set a Static IP Address**

    **Edit the network configuration file to set a static IP address.**

    ~~~bash
    sudo nano /etc/network/interfaces
    ~~~

    **Add the following lines (adjust for your network):**

    auto eth0

    iface eth0 inet static

        address 192.168.1.100

        netmask 255.255.255.0

        gateway 192.168.1.1

        dns-nameservers 8.8.8.8 8.8.4.4

    **Restart the networking service.**

    ~~~bash
    sudo systemctl restart networking
    ~~~

    **I did sudo nano /etc/network/interfaces to edit the file and add the above lines in it.**
    ![alt text](screeenshots/network-interfaces.png)

- **Step 2: Test Network Connectivity:**

    **Use ping to test connectivity to the gateway and an external site (e.g., Google).**

    ~~~bash
    ping 192.168.1.1
    ping google.com
    ~~~

    **I did ping 192.168.1.1 and ping google.com to test my connectivity**

    ![alt text](screeenshots/ping-1.png)

    ![alt text](screeenshots/ping-2.png)

- **Step 3: Capture Network Traffic:**

    **Use tcpdump to capture network traffic on the eth0 interface.**

    ~~~bash
    sudo tcpdump -i eth0 -w capture.pcap
    ~~~

    **Analyze the captured traffic using tcpdump or Wireshark.**

    ~~~bash
    tcpdump -r capture.pcap
    ~~~

    **I used tcpdump to capture network traffic on the eth0 interface**

    ![alt text](screeenshots/capture.pcap.png)

    **I analyzed the captured traffic using tcpdump**

    ![alt text](screeenshots/capture.pcap.2.png)

- **Step 4: Set Up a Firewall:**

    **Use ufw (Uncomplicated Firewall) to allow SSH and HTTP traffic.**

    ~~~bash
    sudo ufw allow ssh
    sudo ufw allow http
    sudo ufw enable
    ~~~

    **I did the above commands to set up ufw to allow ssh and http traffic**

    ![alt text](<screeenshots/ufw enable.png>)

- **Step 5: Troubleshoot DNS:**

    **Use dig to troubleshoot DNS resolution**

    ~~~bash
    dig google.com
    ~~~

    **I did dig google.com to troubleshoot DNS resolution**

    ![alt text](screeenshots/dig.png)
