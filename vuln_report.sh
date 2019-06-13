#!/bin/bash
# Generate a report of vulns for DTR. 
###################################
# edit vars
###################################
set -e

#set variables
dtr_server=dtr.dockr.life
username=admin

######  NO MOAR EDITS #######
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

function vuln_report (){
#get password
#read -sp 'password: ' password;
password=Pa22word

#get image list
image_list=$(curl -skX GET -u admin:$password "https://$dtr_server/api/v0/repositories/?pageSize=10&count=false" -H "accept: application/json" |jq -r '.repositories[] | "\(.namespace)/\(.name)"')

#image_list="admin/alpine"
for i in $image_list; do
  tag_list=$(curl -skX GET -u admin:$password  "https://$dtr_server/api/v0/repositories/$i/tags?pageSize=10000&count=false&includeManifests=false" -H "accept: application/json" | jq -r '.[].name')

  if [ ! -z "$tag_list" ]; then 
    for x in $tag_list; do
     
     critical=$(curl -skX GET -u admin:$password "https://$dtr_server/api/v0/repositories/$i/tags/$x?pageSize=10&000count=false&includeManifests=false" -H 'accept: application/json' | jq -r '.[].vuln_summary.critical')

     if [[ $critical > 0 ]]; then echo -n "$RED"; fi

     echo $i":"$x" "$NORMAL" "$(curl -skX GET -u admin:$password "https://$dtr_server/api/v0/repositories/$i/tags/$x?pageSize=10&000count=false&includeManifests=false" -H 'accept: application/json' | jq -j '"Date: ", .[].vuln_summary.check_completed_at, " Critical: ", .[].vuln_summary.critical, " Major: ", .[].vuln_summary.major, " Minor: ", .[].vuln_summary.minor '; echo "") | column -t 
      
    done 
  fi
done
}

vuln_report
