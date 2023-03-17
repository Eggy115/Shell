#!/bin/bash
# Description		: This will show all OS accounts that don't have a password set.

get_user_names(){
  nopass=`passwd -${1}a | grep -o "^.* NP"`

  for i in ${nopass/ /_}
  {
    nopassnames="${nopassnames:- } $i"
  }
}

if [[ "$OSTYPE" == *linux-gnu* ]]; then
  get_user_names S
elif [[ "$OSTYPE" == *sunos* ]]; then
  get_user_names s
fi

if [ -z "$nopassnames" ]
  then
    echo "Good - All user accounts have a password."
  else
    echo "ERROR: The users listed below have no password set:"\
         "       ${nopassnames//_NP/}" 1>&2
    exit 1
fi
