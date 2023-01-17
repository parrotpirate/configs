ct() {
  target=
  case $1 in
  parent)
    target='q4fw'
    ;;

  child)
    target='q4fw-theme'
    ;;

  *)
    target="$1"
    ;;
  esac

  if [[ ! -z "$target" ]]; then
    codetarget=$(find ./ -name "$target")
    code "${codetarget}"
  fi
}

function finds() {

  WHITE=$(tput setab 7)
  GREEN=$(tput setaf 2)
  YELLOW=$(tput setaf 3)
  RED=$(tput setaf 1)
  RESET=$(tput sgr0)

  if [ -z "$1" ]; then
    echo "\n${RED}No search term provided${RESET}"
    return 0
  fi

  IFS=$'\n'
  target=($(find $HOME/sites -maxdepth 1 -type d -name \*${1}\*))
  unset IFS

  if [ ${#target[@]} -eq 0 ]; then
    echo "\n${RED}No files found${RESET}"
    return 0
  fi

  if [ ${#target[@]} -eq 1 ]; then
    echo "\n${GREEN}Selected: ${target[1]}${RESET}"
    cd "${target[1]}"
  else
    echo "Multiple files found.  Please select one:\n"
    for ((i = 1; i <= ${#target[@]}; i++)); do
      echo "${YELLOW}$i: ${target[$i]}${RESET}"
    done
    echo "\n"
    read "selection?Enter selection: "
    echo "\n${GREEN}Selected: ${target[$selection]}${RESET}"
    cd "${target[$selection]}"
  fi
}

ziprez() {
  folder=${PWD##*/}
  folder=${folder:-/}
  destination="$HOME/Downloads/rezfusion-components.zip"

  if [[ -f "$destination" ]]; then
    rm "$destination"
  fi

  if [[ $folder == "rezfusion-components" ]]; then
    cd ..
    zip -rX "$destination" rezfusion-components --exclude rezfusion-components/\*.zip rezfusion-components/.git/\* rezfusion-components/.gitignore rezfusion-components/node_modules/\* rezfusion-components/.DS_Store
  else
    zip -rX "$destination" rezfusion-components --exclude rezfusion-components/\*.zip rezfusion-components/.git/\* rezfusion-components/.gitignore rezfusion-components/node_modules/\* rezfusion-components/.DS_Store
  fi
}
