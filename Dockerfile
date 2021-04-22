# Start FROM Nvidia PyTorch image https://ngc.nvidia.com/catalog/containers/nvidia:pytorch
FROM nvcr.io/nvidia/pytorch:21.03-py3

# Install linux packages
RUN apt update && apt install -y zip htop screen libgl1-mesa-glx

# Install python dependencies
COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN pip uninstall -y nvidia-tensorboard nvidia-tensorboard-plugin-dlprof
RUN pip install --no-cache -r requirements.txt coremltools onnx gsutil notebook

# Create working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copy contents
#COPY . /usr/src/app

# Set environment variables
ENV HOME=/usr/src/app


EXPOSE 5000

#WORKDIR /app

#RUN pip install -r requirements.txt

ADD requirements.txt /usr/src/app
RUN pip install -r requirements.txt

ADD . /usr/src/app



CMD [ "python", "restapi.py", "--port", "5000"]