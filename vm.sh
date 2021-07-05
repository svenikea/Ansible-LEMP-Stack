#! /bin/bash

read -p "Type in the username: " username
read -p "Paste in User Public Key: " user_public_key
read -p "The Hostname of this VM: " host_name
read -p "The Designated IP Address of this VM: " ip
defaultpass="Aa@123456"

local_config () {
	sudo useradd -m $username -s /bin/bash
	sudo echo $defaultpass | passwd $username --stdin
	sudo mkdir -p /home/$username/.ssh
	sudo usermod -aG $group $username 
	sudo echo $user_public_key > /home/$username/.ssh/authorized_keys
	sudo chown -R $username:$username /home/$username/.ssh
	sudo chmod 644 /home/$username/.ssh/authorized_keys
	sudo sed "s/template/$host_name/g" -i /etc/hostname
	sudo sed "s/PasswordAuthentication yes/PasswordAuthentication no/g" -i /etc/ssh/sshd_config
}
source /etc/os-release
read "Add new user? [yes(y)/no(n)] " answer
while [[ $answer == "y"  $answer == "yes" ]]
do
	if [[ $ID == "debian" || $ID == "ubuntu" ]]
	then
		echo "Detected $PRETTY_NAME which is supported"
		group_name="sudo"
		local_config
		sudo sed "s/172.16.200.12/$ip/g" -i /etc/netplan/oo-installer-config.yaml
		sudo netplan apply
	elif [[ $ID == "centos" || $ID == "rhel"  ]]
	then
		echo "Detected $PRETTY_NAME which is supported"
		group_name="wheel"
		local_config
		sudo sed "s/172.16.200.12/$ip/g" -i /etc/sysconfig/network-scripts/ifcfg-eth0
		sudo systemctl restart network
	else
		echo "Unsupported Distribution"
	fi
done

sudo systemctl restart sshd 
sudo systemctl reboot now
