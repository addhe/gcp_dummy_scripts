#!/bin/sh
exclude_project="exclude-project-dev exclude-project-stg"
for a in $(gcloud projects list --filter="NOT (projectId=$(echo $exclude_project | sed 's/ / OR projectId=/g'))"| grep "dev\|stg" | awk '{print $1}')
do
  if [[ $a != $exclude_project ]]; then
    echo "Checking Project $a..."
    gcloud compute instances list --project $a --filter status=RUNNING
  else
    echo "Skip project $a.. it's include in the list"
  fi
done
