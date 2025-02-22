#!/usr/bin/env bash

set -ex

VIDEO_DEVICE=$(udevadm info {{ camera.pci_device }} -q property | grep DEVNAME | cut -d = -f 2)
exec ffmpeg -hide_banner -input_format h264 -video_size 1920x1080 -probesize 64M -i "${VIDEO_DEVICE}" -vcodec copy -acodec copy -f rtsp -rtsp_transport tcp rtsp://myrna.aspens.lan:8554/streams/{{ camera.name }}