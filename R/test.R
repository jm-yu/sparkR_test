if (nchar(Sys.getenv("SPARK_HOME")) < 1) {
    Sys.setenv(SPARK_HOME = "/opt/spark-1.6.0-bin-hadoop2.6")
}


library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
sc <- sparkR.init(master = "local[3]", sparkEnvir = list(spark.driver.memory="2g"),sparkPackages="com.databricks:spark-csv_2.10:1.4.0")
sqlContext <- sparkRSQL.init(sc)

train_df <- read.df(sqlContext,"./train_df.csv","csv", header = "true", inferSchema = "true")
#head(train_df)

jfk_flights <- filter(train_df, train_df$ORIGIN == "JFK")

#cache(jfk_flights)
#unpersist(jfk_flights)


start_time <- Sys.time()
head(agg(group_by(jfk_flights, jfk_flights$DEST), count = n(jfk_flights$DEST)), 5L)
end_time <- Sys.time()
end_time - start_time
