
# build docker image
sudo docker build -t snapform - < snapform.dockerfile

# some permission upate
xhost +"local:docker@"

# start the snapform view with display redirection and mount $HOME/Documents to /opt in the container
sudo docker run -d -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/Documents:/opt -e DISPLAY=unix$DISPLAY --name snapform snapform /tmp/SFViewer/snapform.sh

# remove the running snapform container
sudo docker stop snapform && sudo docker rm snapform


