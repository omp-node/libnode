#!/bin/sh
./configure --shared --openssl-no-asm

make -j$(nproc)
