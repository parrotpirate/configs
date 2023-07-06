function rmpwd () {
read -q "confirmation?Are you sure you want to delete the current directory and all its contents? (y/n) "

if [[ "$confirmation" == "y" || "$confirmation" == "Y" ]]; then
  rm -rf "$(pwd)" && cd ..
  echo "Current directory and its contents have been deleted."
else
  echo "Deletion canceled."
fi
}
