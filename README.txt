Docker + RStudio + sparkR
set up RStudio server with SparkR. Compare the performance of some operations of sparkR and R.


set up RStudio server with SparkR:

$docker run -d -v /Users/jmyu:/home/rstudio -p 8787:8787 --name sparkrstudio vinicius85/sparkr-rstudio

$docker pull vinicius85/spark-rstudio

$docker exec -it sparkrstudio /bin/bash

adduser username #set RStudio username

after setting server. use ifconfig to get ip.
$ifconfig | grep inet

open a browser and enter “ip:8787” to open Rstudio.

test codes will be updated later.

reference: 
https://github.com/vinicius85/docker/tree/master/sparkr-rstudio
	

