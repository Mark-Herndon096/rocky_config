#!/bin/bash

lspci -k | grep -EA3 'VGA|3D|Display'
nvidia-smi
