#!/bin/bash
echo "Starting the server setup ..."

echo "update the server..."
sudo yum update -y
if [ $? -ne 0 ]; then
        echo "Error: Server update failed." >&2
        exit 1
fi

echo "Install http server..."
yum install -y httpd
if [$? -ne 0 ]; then
        echo "Error: Server installation failed." >&2
        exit 1
fi

echo "Starting http server..."
systemctl start httpd
if [ $? -ne 0 ]; then
        echo "Error: Starting server failed." >&2
        exit 1
fi

echo "Enable http server to start on boot..."
systemctl enable httpd
if [ $? -ne 0 ]; then
        echo "Error: Enabling server on boot failed." >&2
        exit 1
fi

echo "Checking the http status..."
systemctl status httpd

echo "Uploading index.html page..."
if [ -f /tmp/index.html ]; then
sudo cp /tmp/index.html /var/www/html/index.html
if [ $? -ne 0 ]; then
        echo "Error: Uploading index.html failed." >&2
        exit 1
fi
else
        echo "Warning: /tmp/index.html not found. Skipping upload." >&2
fi

echo "Opening firefox browser..."
firefox &

echo "Displaying the server ip address..."
ip r l | grep default | awk '{print "Server Ip address: " $9}'

echo "Server setup complete."
~                                                                                                                                                                                                                                
~                            
