#!/bin/bash

echo "Please introduce the path of the .SB3 file"
read sb_path

curl -c cookies.txt https://www.drscratch.org/

csrf_token=$(grep csrftoken cookies.txt | cut -f 7)

curl -s -b cookies.txt -F "csrfmiddlewaretoken=$csrf_token" -F "dashboard_mode=Default" -F "urlProject=" -F "zipFile=@/home/daniel/Downloads/$sb_path" -F "_upload=['']" https://www.drscratch.org/show_dashboard/ > temp.html

lynx temp.html
