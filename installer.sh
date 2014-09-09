#!/bin/sh

# Aptitude
apt-get update
apt-get upgrade -y
apt-get install build-essential cmake -y
apt-get install python-serial python-pip python-gps -y # python dependencies
apt-get install mongodb -y # MongoDB
apt-get install gpsd gpsd-clients python-gps -y # GPS
apt-get install python-matplotlib -y

## OpenCV Dependencies
apt-get install libgtk2.0-dev libqt4-dev libopencv-dev build-essential checkinstall cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils
cd /usr/include/linux
ln -s ../libv4l1-videodev.h videodev.h
ln -s ../libavformat/avformat.h avformat.h

# OpenCV
wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.9/opencv-2.4.9.zip
unzip opencv-2.4.9.zip
cd opencv-2.4.9
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE CMAKE_INSTALL_PREFIX=/usr/local ..
make -j4
make install

## Pip
pip install pymongo
