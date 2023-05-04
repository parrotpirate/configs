#!/bin/bash

# exit when any command fails
set -e

WHITE=$(tput setab 7)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)
RESET=$(tput sgr0)

# Check if a wp-config.php file exists in the current directory and abort if it doesn't
if [ ! -f wp-config.php ]; then
  echo "${RED}No wp-config.php file found. Please run this script from the root directory of your WordPress site.${RESET}"
  exit 1
fi

function spinner() {
  local pid=$!
  local delay=0.5
  local spinstr='|/-\'
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b\b\b"
}

function output() {
  echo -n "${YELLOW}wait"

  spinner $! "${RESET}"

  echo -e "\r${GREEN}Complete!${RESET}"
}

# Get the name of the parent directory
function get_parent_dir() {
  # parent_dir=$(basename "$(dirname "$PWD")")
  parent_dir=$(basename "$PWD")
  backup_name="${parent_dir}-export.zip"
}

# Backup the database
function backup_database() {
  # if seed.sql exists in the current directory remove it
  if [ -f seed.sql ]; then
    rm -f seed.sql
  fi
  wp db optimize --allow-root
  wp db export seed.sql --allow-root
}

# Zip the files
function zip_files() {
  zip -rX "${backup_name}" wp-content seed.sql .git .gitignore --exclude \*.zip
}

# Echo backup file path
function echo_backup_path() {
  echo "${GREEN}Your backup file is located at ${WHITE}${PWD}/${backup_name}${RESET}"
}

function main() {
  get_parent_dir
  echo "Backing up database."
  backup_database >/dev/null 2>&1 &
  output
  echo "Backing up site to ${backup_name}."
  zip_files >/dev/null 2>&1 &
  output
  echo_backup_path
}

main
