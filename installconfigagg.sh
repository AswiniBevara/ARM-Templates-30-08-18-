#!/bin/bash
git clone https://github.com/MobiliyaTechnologies/SecurityAndSurveillance.git
cd SecurityAndSurveillance/Setup/Aggregator
sed -i -e 's/\r$//' install.sh
sudo chmod +x install.sh
./install.sh
cd ~/Aggregator
sudo sed -i -e "s/<UpdateLocation>/East Us2/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<IOTHubConnectionString>/HostName=ssnsiothub.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=vWGvXgLjYB+hRdXmvlZnVmdgUr6HvwzHYLDTvm3I7cM=/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<storageAccountName>/ssnsstrgaccnt/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<storageAccountAccessKey>/xzx6RK\/Yf5O7ZpbbNs5QTNXHWEcl5\/9OR7RPfaWluNO9vCO6X\/MIC5UPy3WVqT30ylmgLzA9Yju34EipkF4jCg==/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<backendUrl>/https:\/\/ssnsrestapp.azurewebsites.net/g" /home/adminuser/Aggregator/config.js
sudo sed -i -e "s/<videoIndexingSubscriptionKey>/115b4fa4a2d0476988a1c0e419760554/g" /home/adminuser/Aggregator/config.js
forever start aggregatorServer.js
node aggregatorServer.js
