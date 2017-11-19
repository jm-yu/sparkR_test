Docker + RStudio + R
Set up Rstudio server and set up sparkR RStudio server. Compare the performance of some operations.

$set up Rstudio server:

$docker pull dceoy/rstudio-server

$docker run -d -v /Users/jmyu:/home/rstudio -p 8788:8787 --name rstudio dceoy/rstudio-server #open an container

$docker exec -it rstudio /bin/bash #enter container
adduser username #set RStudio username



set up sparkR RStudio server:

$docker run -d -v /Users/jmyu:/home/rstudio -p 8787:8787 --name sparkrstudio vinicius85/sparkr-rstudio

$docker pull vinicius85/spark-rstudio

$docker exec -it sparkrstudio /bin/bash

adduser username #set RStudio username

after setting server. use ifconfig to get ip.
$ifconfig | grep inet

open a browser and enter “ip:8788” to use RStudio.
open a browser and enter “ip:8787” to use Rstudio on sparkR.

test codes will be updated later.

reference: 
https://github.com/vinicius85/docker/tree/master/sparkr-rstudio
https://hub.docker.com/r/dceoy/rstudio-server/
	

