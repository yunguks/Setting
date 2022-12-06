#!/bin/bash


sudo apt-get install python3-pip protobuf-compiler libprotoc-dev
pip3 install --upgrade setuptools==59.6.0
pip3 install --upgrade protobuf==3.19.0
pip3 install --upgrade numpy==1.19.4
pip3 install Cython

# install pycuda
pip3 install pycuda==2019.1.2

# install onnx 
pip3 install onnx==1.8.1 --user --verbose
wget https://nvidia.box.com/shared/static/ukszbm1iklzymrt54mgxbzjfzunq7i9t.whl -O onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl
pip3 install onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl
rm onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl

pip3 install nvidia-pyindex
pip3 install onnx-graphsurgeon
