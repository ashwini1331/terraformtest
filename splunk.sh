     sudo su 
     cd /opt/
     tar xvzf splunk-8.0.4.1-ab7a85abaa98-Linux-x86_64.tgz
     cd ../
     sudo /opt/splunk/bin/splunk start --accept-license
     useradd -p 12345678,12345678 admin
     #!bin/bash
     if [ $(id -u) -eq 0 ]; then
	read -p "administrator username : " admin
	read -s -p "enter password : " 12345678
	read -s -p "Renter password : "12345678
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p "$pass" "$username"
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system."
	exit 2
fi
