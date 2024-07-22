#!/bin/bash

## Run as root or sudo bash install_nvidia_drivers.sh
dnf config-manager --set-enabled crb
dnf install \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
    https://dl.fedoraproject.org/pub/epel/epel-next-release-latest-9.noarch.rpm
dnf config-manager --add-repo http://developer.download.nvidia.com/compute/cuda/repos/rhel9/$(uname -i)/cuda-rhel9.repo
dnf install kernel-headers-$(uname -r) kernel-devel-$(uname -r) tar bzip2 make automake gcc gcc-c++ pciutils elfutils-libelf-devel libglvnd-opengl libglvnd-glx libglvnd-devel acpid pkgconfig dkms
dnf module install nvidia-driver:latest-dkms
dnf module list nvidia-driver
nvidia-xconfig
echo "blacklist nouveau" | tee /etc/modprobe.d/blacklist-nouveau.conf
