#!/bin/bash -ex

# Hardlinking
hardlink -v /media/DATA_n1 &
hardlink -v /media/DATA_n2 &
wait

