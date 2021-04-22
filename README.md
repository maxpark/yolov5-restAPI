# yolov5-restAPI
Docker container of a RestAPI for yolov5 projects

# Install Docker and Nvidia-Docker
Docker images come with all dependencies preinstalled, however Docker itself requires installation, and relies of nvidia driver installations in order to interact properly with local GPU resources. The requirements are:

  Nvidia Driver >= 455.23 https://www.nvidia.com/Download/index.aspx
  Nvidia-Docker https://github.com/NVIDIA/nvidia-docker
  Docker Engine - CE >= 19.03 https://docs.docker.com/install/

Source: https://github.com/ultralytics/yolov5/wiki/Docker-Quickstart#1-install-docker-and-nvidia-docker

# Build docker 
  1. yolov5-restAPI
  2. docker build -t yolov5-flask .
  3. docker run -p 5000:5000 yolov5-flask:latest

# Test api via curl  
  1. cd yolov5-restAPI
  2. curl -X POST -F image=@tests/guns.jpg 'http://localhost:5000/v1/gun-detection/yolov5'
