#!/bin/bash

# Define the path to the local backups directory
local_backup_dir="/home/pi/docker/homeassistant/data/backups"

# Define the name of your remote and the path to the remote backups directory
remote="google-drive"
remote_backup_dir="Backups"

# Define the number of days after which backups should be deleted
delete_after_days=30

# Sync the local backups with the remote
rclone sync $local_backup_dir $remote:$remote_backup_dir

echo "rclone sync $local_backup_dir $remote:$remote_backup_dir"

# Delete backups older than $delete_after_days days
rclone delete $remote:$remote_backup_dir --min-age $delete_after_days
