#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

if [ -d newproject ]; then
  echo "Directory 'newproject' already exists. Please remove it before running this script."
  exit 1
fi
mkdir newproject
cd newproject

mkdir analysis output
touch README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip -q rawdata.zip

###########################################
# Complete assignment here

# 1. Create a directory named data
cd "/Users/corymckenzie/Desktop/shell/02_activities/assignments"
mkdir data

# 2. Move the ./rawdata directory to ./data/raw
cd "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data"
mkdir raw
mv "/Users/corymckenzie/Desktop/shell/02_activities/assignments/newproject/rawdata" "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data/raw/rawdata"

# 3. List the contents of the ./data/raw directory
cd "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data/raw"
ls

# 4. In ./data/processed, create the following directories: server_logs, user_logs, and event_logs
cd "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data"
mkdir processed
cd processed
mkdir server_logs user_logs event_logs

# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs
find "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data/raw/rawdata" -name "*server*.log" -exec cp {} "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data/processed/server_logs" \;


# 6. Repeat the above step for user logs and event logs
find "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data/raw/rawdata" -name "*user*.log" -exec cp {} "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data/processed/user_logs" \;
find "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data/raw/rawdata" -name "*event*.log" -exec cp {} "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data/processed/event_logs" \;

# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
cd "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data/raw/rawdata"
rm *ipaddr*.*
cd "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data/processed/user_logs"
rm *ipaddr*.*

# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed
cd "/Users/corymckenzie/Desktop/shell/02_activities/assignments/data"
ls -R > inventory.txt

###########################################

echo "Project setup is complete!"
