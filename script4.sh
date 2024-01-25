#!/bin/bash
if [ $# -eq 0 ]; then
    echo "invalid input"
    exit 1
fi
path=$1
exiftool "$path"
if [ "$path" == *.pcap ]
then
tcpdump -r "$path"
else
exiftool "$path"
mediainfo "$path"
fi
