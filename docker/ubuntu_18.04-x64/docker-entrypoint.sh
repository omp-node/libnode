#!/bin/sh
./configure --shared

make -j$(nproc)
