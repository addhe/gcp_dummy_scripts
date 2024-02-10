#!/bin/sh
exclude_project="maverick-dev-374308 fir-baas-dev"
for a in $(gcloud projects list --filter="NOT (projectId=$(echo $exclude_project | sed 's/ / OR projectId=/g'))"| grep "dev\|stg" | awk '{print $1}')
do
  if [[ $a != $exclude_project ]]; then
    echo "project $a tidak ada di list"
  else
    echo "project $a kita check yah"
  fi
  #gcloud compute instances list --project $a --filter status=RUNNING
  #echo "-----"
done
