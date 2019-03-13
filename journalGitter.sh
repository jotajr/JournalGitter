#!/bin/bash

echo "Starting the Journal"

display_help() {
  echo
  echo "Usage of Journal Gitter:"
  echo
  echo " -h, --help            Display this usage instructions"
  echo " -a, --add | \"Entry\"   Add a entry to Journal"
  echo
}

show_error() {
  local error_message="$@"
  echo "${error_message}" 1>&2;
}

add_entry() {
    git log -1 >> Journal2019.txt
    git add .
    local entry="$@"
    git commit -m "${entry}" 
}

argument1="$1"
argument2="$2"
if [[ -z $argument1 ]] ; then
  show_error "Verify your command!"
  display_help
else
  case $argument1 in
    -h|--help)
        display_help
        ;;
    -a|--add)
        if [[ -z $argument2 ]] ; then
            show_error "Add your Entry"
        else
            add_entry "$argument2"
        fi
        ;;
    *)
      raise_error "Unknown argument: ${argument}"
      display_usage
      ;;
  esac
fi

echo "Finished the Journal Gitter"
