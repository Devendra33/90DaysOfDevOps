#!/bin/bash

read -p "Enter the Name of Service: " service

read -p "Do you want to check the status of the service? [y/n] " flag

if [ "$flag" = "y" ]; then
    systemctl status $service
else
    echo "Skipped."
    exit 1
fi