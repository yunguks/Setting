# install opencv
apt-get update -y
apt-get install cmake gcc g++ -y

# apt-get install -y openjdk-8-jdk
# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
apt-get -y libglew-dev libtiff5-dev zlib1g-dev libjpeg-dev \
libpng12-dev libjasper-dev libavcodec-dev libavformat-dev \
libavutil-dev libpostproc-dev libswscale-dev libeigen3-dev \
libtbb-dev libgtk2.0-dev pkg-config

apt-get install -y python3-dev python3-numpy python3-py python3-pytest
apt-get update -y

OPENCV_VER="4.5.1"
# download opencv
cd ../
if [ -d 'opencv' ]; then
    echo ''
else
    mkdir opencv
fi
cd opencv
if [ -e 'opencv.zip' ]; then
    echo "opencv.zip is exists."
else
    wget -O opencv.zip https://github.com/opencv/opencv/archive/refs/tags/$OPENCV_VER.zip
fi

if [ -e 'opencv_contrib.zip' ]; then
    echo "opencv_contrib.zip is exists."
else
    wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/$OPENCV_VER.zip
fi

if [ -d "opencv-$OPENCV_VER" ]; then
    echo "opencv directory is exists"
else
    unzip opencv.zip
fi

if [ -d "opencv_contrib-$OPENCV_VER" ]; then
    echo "opencv_contrib directory is exists"
else
    unzip opencv_contrib.zip
fi

# lastest version
# git clone https://github.com/opencv/opencv.git
# git clone https://github.com/opencv/opencv_contrib.git
cd ./opencv-4.5.1
if [ -d 'build' ]; then
    echo ''
else
    mkdir build
fi
cd build
pwd

cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D BUILD_opencv_python3=ON \
    -D BUILD_opencv_python2=OFF \
    -D PYTHON3_EXECUTABLE=$(which python3) \
    -D PYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
    -D PYTHON_INCLUDE_DIR2=$(python3 -c "from os.path import dirname; from distutils.sysconfig import get_config_h_filename; print(dirname(get_config_h_filename()))") \
    -D PYTHON_LIBRARY=$(python3 -c "from distutils.sysconfig import get_config_var;from os.path import dirname,join ; print(join(dirname(get_config_var('LIBPC')),get_config_var('LDLIBRARY')))") \
    -D PYTHON3_NUMPY_INCLUDE_DIRS=$(python3 -c "import numpy; print(numpy.get_include())") \
    -D PYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=ON \
    -D BUILD_DOCS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_PACKAGE=OFF \
    -D BUILD_EXAMPLES=OFF \
    -D WITH_TBB=ON \
    -D ENABLE_FAST_MATH=1 \
    -D CUDA_FAST_MATH=1 \
    -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda \
    -D WITH_CUDA=ON \
    -D WITH_CUBLAS=ON \
    -D WITH_CUFFT=ON \
    -D WITH_NVCUVID=ON \
    -D WITH_IPP=OFF \
    -D WITH_V4L=ON \
    -D WITH_1394=OFF \
    -D WITH_GTK=ON \
    -D WITH_QT=OFF \
    -D WITH_OPENGL=ON \
    -D WITH_EIGEN=ON \
    -D WITH_FFMPEG=ON \
    -D WITH_GSTREAMER=ON \
    -D BUILD_JAVA=OFF \
    -D BUILD_NEW_PYTHON_SUPPORT=ON \
    -D OPENCV_SKIP_PYTHON_LOADER=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.5.1/modules \
    -D WITH_CUDNN=ON \
    -D OPENCV_DNN_CUDA=ON \
    -D CUDA_ARCH_BIN=8.6 \
    -D CUDA_ARCH_PTX=8.6 ..
    # -D CUDNN_LIBRARY=/usr/local/cuda/targets/x86_64-linux/libcudnn.so.8.4.1 \
    # -D CUDNN_INCLUDE_DIR=/usr/local/cuda/targets/x86_64-linux/include .. 

make -j$(nproc)

make install

/bin/bash -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
ldconfig