set up R studio server and set up sparkR server.
R studio server:
docker pull dceoy/rstudio-server

docker run -d -v /Users/jmyu:/home/rstudio -p 8788:8787 --name rstudio dceoy/rstudio-server

docker exec -it rstudio /bin/bash

docker run -d -v /Users/jmyu:/home/rstudio -p 8787:8787 --name sparkrstudio vinicius85/sparkr-rstudio

docker pull vinicius85/spark-rstudio

docker exec -it sparkrstudio /bin/bash
