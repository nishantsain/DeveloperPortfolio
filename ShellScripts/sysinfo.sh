
#!/bin/bash


# Author: Nishant
# Purpose: Generate System Information Report

echo "======================================"
echo "       SYSTEM INFORMATION REPORT"
echo "======================================"

echo "Name: Nishant"
echo "Roll Number: 2601730067"
echo "Date: $(date)"

echo ""
echo "CPU INFORMATION"
echo "--------------------------------------"

lscpu | grep -E 'Model name|CPU\(s\):' | head -2

echo ""
echo "MEMORY INFORMATION"
echo "--------------------------------------"

free -h | awk 'NR==2 {
    print "Total Memory: " $2
    print "Used Memory: " $3
}'

echo ""
echo "TOP 3 PROCESSES BY CPU"
echo "--------------------------------------"

ps -eo pid,comm,%cpu --sort=-%cpu | head -4

echo ""
echo "======================================"
echo "Report generated successfully."
echo "======================================"
