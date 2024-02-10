#!/bin/sh

exclude_project="exclude-project-dev exclude-project-stg"

for a in $(gcloud projects list | grep "dev\|stg" | awk '{print $1}')
do
  if [[ ! $exclude_project =~ $a ]]; then
    echo "checking sql status on project $a"
    gcloud sql instances list --project $a --filter STATUS=RUNNABLE
    echo "-----"
  else
    echo "skip check project $a, due to it's in the list exclude"
  fi
done
