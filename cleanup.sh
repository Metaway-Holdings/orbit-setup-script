#!/bin/bash

# Stop and remove all containers, including volumes
sudo docker-compose down
# sudo docker-compose up
# Check if there are any containers to remove
if [ "$(sudo docker ps -qa)" ]; then
	    # Try to stop all containers first
	        sudo docker stop $(sudo docker ps -qa)
		    # Force remove all containers
		        sudo docker rm -v -f $(sudo docker ps -qa)
		else
			    echo "No containers to remove."
fi

# Remove all unused images
#sudo docker image prune -a -f

# Remove all unused volumes
#sudo docker volume prune -f

# Remove all unused networks
#sudo docker network prune -f

# Optionally, clean up system
#sudo docker system prune -a -f --volumes

