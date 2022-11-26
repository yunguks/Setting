# !/bin/bash

# install torch 1.9
sudo apt-get install python3-pip libjpeg-dev libopenblas-dev libopenmpi-dev libopm-dev
sudo -H pip3 install future
sudo pip3 install -U --user wheel mock pillow
sudo -H pip3 install testresources

sudo -H pip3 install setuptools==58.3.0
sudo -H pip3 install Cython

sudo -H pip3 install gdown

gdwon https://drive.google.com/uc?id=1wzIDZEJ9oo62_H2oL7fYTp5_-NffCXzf

sudo -H pip3 install torch-1.9.0a0+gitd69c22d-cp36-cp36m-linux_aarch63.whl

rm torch-1.9.0a0+gitd69c22d-cp36-cp36m-linux_aarch63.whl