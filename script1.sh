#!/bin/bash
echo "Enter File Path:"
read path
size=$(du -sh $path)
type=$(file $path)
permissions=$(stat $path)
echo $size
echo $type
echo $permissions
