This is a demo for presenting sparkR.

Docker + R Studio + sparkR

set up R Studio server with SparkR on docker:

$docker run -d -v /Users/jmyu:/home/rstudio -p 8787:8787 --name sparkrstudio vinicius85/sparkr-rstudio

$docker pull vinicius85/spark-rstudio

$docker exec -it sparkrstudio /bin/bash

adduser username #set R studio username

after setting server. use ifconfig to get ip.
$ifconfig | grep inet

open a browser and enter “ip:8787” to open R studio.

run codes on R studio

reference: 
https://github.com/vinicius85/docker/tree/master/sparkr-rstudio
	

