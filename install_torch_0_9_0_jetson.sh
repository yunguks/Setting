# !/bin/bash

# install torch 1.9
sudo apt-get install python3-pip libjpeg-dev libopenblas-dev libopenmpi-dev libomp-dev
sudo -H pip3 install future
sudo pip3 install -U --user mock pillow
sudo -H pip3 install testresources

sudo -H pip3 install gdown

gdown https://drive.google.com/uc?id=1wzIDZEJ9oo62_H2oL7fYTp5_-NffCXzt
sudo -H pip3 install torch-1.9.0a0+gitd69c22d-cp36-cp36m-linux_aarch64.whl

rm torch-1.9.0a0+gitd69c22d-cp36-cp36m-linux_aarch64.whl

# torch vision
sudo apt-get install libjpeg-dev zlib1g-dev libpython3-dev libavcodec-dev libavformat-dev libswscale-dev

pip3 install torchvision-0.10.0a0+300a8a4-cp36-cp36m-linux_aarch64.whl
sudo -H pip3 install torchvision-0.10.0a0+300a8a4-cp36-cp36m-linux_aarch64.whl
rm torchvision-0.10.0a0+300a8a4-cp36-cp36m-linux_aarch64.whl
