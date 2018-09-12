#!/bin/bash
git clone https://github.com/MobiliyaTechnologies/SecurityAndSurveillance.git
cd SecurityAndSurveillance/Setup/Aggregator
sed -i -e 's/\r$//' install.sh
sudo chmod +x install.sh
./install.sh
cd ~/Aggregator
sudo sed -i -e "s/<UpdateLocation>/East Us2/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<IOTHubConnectionString>/HostName=priyaiothubpukpu.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=59bt5Z8xI8d9sxonjmsIvWlYEnCznyisDbQEVGak4fI=/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<storageAccountName>/priyastrgaccntpukpu/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<storageAccountAccessKey>/2vwY6VMH4YSvAtr8RIdFbQwTJ+pcvFBYFf9kb0Jg1HQ9HsCMri2GsAfo\/N8yr+fSrVlGtdX8wq7Db4PGm8h6jA==/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<backendUrl>/https:\/\/priyarestapppukpu.azurewebsites.net/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<videoIndexingSubscriptionKey>/115b4fa4a2d0476988a1c0e419760554/g" /home/adminuser/Aggregator/config.js
forever start aggregatorServer.js
node aggregatorServer.js
