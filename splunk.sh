     wget -O splunk-8.0.4.1-ab7a85abaa98-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.4.1&product=splunk&filename=splunk-8.0.4.1-ab7a85abaa98-Linux-x86_64.tgz&wget=true'
     sudo mv splunk-8.0.4.1-ab7a85abaa98-Linux-x86_64.tgz /opt/
     sudo su 
     cd /opt/
     tar xvzf splunk-8.0.4.1-ab7a85abaa98-Linux-x86_64.tgz
     cd ../
     sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt --gen-and-print-passwd
     
     
    
 
