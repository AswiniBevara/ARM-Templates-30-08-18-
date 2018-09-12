#!/bin/bash
git clone https://github.com/MobiliyaTechnologies/SecurityAndSurveillance.git
cd SecurityAndSurveillance/Setup/Aggregator
sed -i -e 's/\r$//' install.sh
sudo chmod +x install.sh
./install.sh
cd ~/Aggregator
sudo sed -i -e "s/<UpdateLocation>/East Us2/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<IOTHubConnectionString>/HostName=basiciothubruhqs.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=S6AX2uB3S6\/I9jmYGqG679qXMkGUDZzHUqjm6VzepzQ=/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<storageAccountName>/basicstrgaccntruhqs/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<storageAccountAccessKey>/\/xc+9mwnwys6dJz\/xV47W2KrO0YhjYEB\/\/c6wkdpLF4RFwF\/m2XspY1MuOYfzm0UGlg+BwK9hDPl3BPGlMocJA==/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<backendUrl>/https:\/\/basicrestappruhqs.azurewebsites.net/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<videoIndexingSubscriptionKey>/115b4fa4a2d0476988a1c0e419760554/g" /home/adminuser/Aggregator/config.js
forever start aggregatorServer.js
node aggregatorServer.js
