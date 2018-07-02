# vuln_report

## Purpose
This script is to scrape DTR for the vulnerability of each image:tag. Test it out!

## Edit the Script
```
vim vuln_report.sh
```

## Run
```
./vuln_report.sh
```

## Sample output
```
clemenko:vuln_report clemenko $ ./vuln_report.sh 
admin/alpine:latest  Date: 2018-07-02T19:01:30.679397661Z Critical: 0 Major: 0 Minor: 0
admin/alpine_build:latest  Date: 2018-07-02T19:01:31.590596034Z Critical: 0 Major: 0 Minor: 0
admin/flask:latest  Date: 2018-07-02T19:01:32.582296742Z Critical: 2 Major: 5 Minor: 0
admin/flask_build:latest  Date: 2018-07-02T19:01:33.684757437Z Critical: 2 Major: 5 Minor: 0
admin/nginx:latest  Date: 2018-07-02T19:01:34.92015332Z Critical: 14 Major: 37 Minor: 1
```
