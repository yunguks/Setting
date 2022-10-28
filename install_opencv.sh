apt-get install python-opencv
apt-get install cmake
apt-get install gcc g++

apt-get install python3-dev python3-numpy

apt-get install libavcodec-dev libavformat-dev libswscale-dev
apt-get install libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev

apt-get install libgtk-3-dev

apt-get install libpng-dev
apt-get install libjpeg-dev
apt-get install libopenexr-dev
apt-get install libtiff-dev
apt-get install libwebp-dev

apt-get install git
git clone https://github.com/opencv/opencv.git

cd opencv
mkdir build
cd build

cmake ../
make
make install

pip3 install opencv-python==4.5.1.48
apt-get update && apt-get install libgl1 -y