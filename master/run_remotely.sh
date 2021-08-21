#!/bin/bash

echo "Running remote script"
FILE=/root/work/remote_script.log
touch $FILE
echo "Running remote script on worker: " >> $FILE
echo $(date) >> $FILE
