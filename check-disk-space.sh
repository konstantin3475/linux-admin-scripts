#!/bin/bash

# ------------------------------------------------------------
# check-disk-space.sh
#
# Purpose:
# Checks all mounted filesystems and reports partitions
# that exceed a defined disk usage threshold.
#
# Author: Konstantin Kountouroyanis
# ------------------------------------------------------------

# Warning threshold in percent.
# A warning is generated when disk usage reaches or exceeds
# this value.
THRESHOLD=90

# Read filesystem usage information.
#
# df -h:
#   Displays disk usage in a human-readable format.
#
# awk:
#   Extracts only the usage percentage (column 5)
#   and mount point (column 6).
#
# Example:
#   92% /
#   45% /home
#
df -h | awk 'NR>1 {print $5 " " $6}' | while read output;
do

    # Extract the numeric usage value.
    # Example:
    #   "92%" -> "92"
    usage=$(echo "$output" | awk '{print $1}' | cut -d'%' -f1)

    # Extract the mount point.
    # Example:
    #   "/"
    #   "/home"
    partition=$(echo "$output" | awk '{print $2}')

    # Compare current usage with threshold.
    if [ "$usage" -ge "$THRESHOLD" ]; then

        # Print a warning message.
        echo "Warning: Partition $partition is ${usage}% full."

    fi

done
