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
  parent_dir=$(basename "$(dirname "$PWD")")
  current_date=$(date +"%Y-%m-%d")
  backup_name="${parent_dir}-backup_${current_date}.zip"
}

# Set list of files/folders to exclude
function set_excludes() {
  while true; do
    # Get the list of files in the current directory
    files=($(ls -A))

    # Print the list of files
    echo "Select the files you want to choose from: "
    for ((i = 0; i < ${#files[@]}; i++)); do
      # echo "$i: ${files[$i]}"
      if ((i % 2 == 0)); then
        echo -e "\e[1m\e[32m$i: ${files[$i]}\e[0m"
      else
        echo -e "\e[1m\e[34m$i: ${files[$i]}\e[0m"
      fi
    done

    # Prompt the user to select the files they want
    echo "Enter a comma-separated list of file numbers (e.g. 0,2,3): "
    read choices

    # Create an array of the chosen files
    chosen_files=()
    IFS=',' read -ra selected <<<"$choices"
    for index in "${selected[@]}"; do
      chosen_files+=("${files[$index]}")
    done

    # Print the chosen files and prompt for confirmation
    echo "You have chosen the following files: "
    for file in "${chosen_files[@]}"; do
      echo "$file"
    done
    read -p "Is this correct? (y/n) " yn
    case $yn in
    [Yy]*) break ;;
    [Nn]*) continue ;;
    *) echo "Please answer yes or no." ;;
    esac
  done

  # exclude_list="--exclude \*.zip ${chosen_files[*]}"
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

# Reset the database
function reset_database() {
  wp db reset --yes --allow-root
}

# Zip the files
function zip_files() {
  zip -rmX "${backup_name}" . --exclude \*.zip "${chosen_files[*]}"
}

function testfile() {
  echo "zip -rmX ${backup_name} . "
}

# Cleanup leftover files
function cleanup() {
  rm -rf "${chosen_files[@]}"
  shopt -s extglob
  rm -rf !"${backup_name}"
  shopt -u extglob
}

function coldstorage() {
  get_parent_dir
  set_excludes
  echo "Backing up database."
  backup_database >/dev/null &
  output
  echo "Resetting database."
  reset_database >/dev/null &
  output
  echo "Backing up site to ${backup_name}."
  zip_files >/dev/null &
  output
  echo "Cleaning up."
  cleanup >/dev/null &
  output
  echo "${GREEN}${WHITE}Site backup complete. You can now suspend the account.${RESET}" &
  tput bel
}

coldstorage
