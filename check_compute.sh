#!/bin/sh

exclude_project="exclude-project-dev exclude-project-stg"

for a in $(gcloud projects list | grep "dev\|stg" | awk '{print $1}')
do
  if [[ ! $exclude_project =~ $a ]]; then
    echo "Check Project $a...."
    gcloud compute instances list --project $a --filter status=RUNNING
  else
    echo "Skip Check Project $a."
  fi
done
