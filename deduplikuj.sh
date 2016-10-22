#!/bin/bash -x

taskset -c 3 nice -n -10 hardlink -c /media/DATA/

