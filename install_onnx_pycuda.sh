#!/bin/bash

# install pycuda
pip3 install Cython
pip3 install pycuda

# install onnx, onnxruntime
sudo apt-get install python3-pip protobuf-compiler libprotoc-dev
pip3 install protobuf==3.3.0
pip3 install numpy==1.19.4
pip3 install onnx==1.8.1 --user --verbose
wget https://nvidia.box.com/shared/static/ukszbm1iklzymrt54mgxbzjfzunq7i9t.whl -O onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl
pip3 install onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl
rm onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl
