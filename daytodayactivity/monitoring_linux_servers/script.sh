#!/bin/bash

while true; do
    clear
    echo "Monitoring Linux Servers..."
    echo "-----------------------------"

    # Display CPU usage
    echo "CPU Usage:"
    top -b -n1 | grep "Cpu(s)"

    # Display Memory usage
    echo -e "\nMemory Usage:"
    free -h

    # Display Disk usage
    echo -e "\nDisk Usage:"
    df -h

    # Display Network usage
    echo -e "\nNetwork Usage:"
    ifconfig

    # Wait for 5 seconds before refreshing
    sleep 5
done