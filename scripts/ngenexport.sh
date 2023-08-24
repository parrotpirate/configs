#!/usr/bin/env bash

# exit when any command fails
set -e

WHITE=$(tput setaf 7)
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
  export_name="${parent_dir}-export_${current_date}.xml"
  backup_name="${parent_dir}-ngenexport_${current_date}.zip"
}

#run Wordpress xml export
function export_wp() {
  wp export --filename_format="${export_name}" --allow-root
}

#generate export archive
function generate_archive() {
  zip -rmX "${backup_name}" "${export_name}" --quiet
  zip -rX "${backup_name}" wp-content --exclude \*.zip \*.tar --quiet
  output
}

# Echo backup file path
function echo_backup_path() {
  echo "${GREEN}Your backup file is ready.  Please run:${RESET}"
  echo "${YELLOW}scp q4host:${PWD}/${backup_name} .${RESET}"
}

function main() {
  get_parent_dir
  echo "${WHITE}Exporting WordPress content...${RESET}"
  export_wp >/dev/null 2>&1 &
  output
  echo "${WHITE}Generating export archive...${RESET}"
  generate_archive >/dev/null 2>&1 &
  output
  echo_backup_path
}

main
