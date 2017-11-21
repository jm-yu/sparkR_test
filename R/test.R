if (nchar(Sys.getenv("SPARK_HOME")) < 1) {
    Sys.setenv(SPARK_HOME = "/opt/spark-1.6.0-bin-hadoop2.6")
}
library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
#sparkR.stop()
sc <- sparkR.init(master = "local[3]",sparkPackages="com.databricks:spark-csv_2.10:1.4.0")
sqlContext <- sparkRSQL.init(sc)

#load data
df <- read.df(sqlContext,"./train_df.csv","csv", header = "true", inferSchema = "true")

printSchema(df)
head(df)

#some operations of sparkR
head(select(df, df$ARR_DELAY));

head(select(filter(df, df$ARR_DELAY < 7), df$ARR_DELAY))

jfk_flights <- filter(df, df$ORIGIN == "JFK")
head(jfk_flights)

#to compare running timw with and without cache.
cache(jfk_flights)
#unpersist(jfk_flights)
start_time <- Sys.time()
jfk_dests <- summarize(group_by(jfk_flights, jfk_flights$DEST), count = n(jfk_flights$DEST))
head(arrange(jfk_dests, desc(jfk_dests$count)))
end_time <- Sys.time()
end_time - start_time


#use SQL to query the data
head(df)
sqlContext <- sparkRSQL.init(sc)
registerTempTable(df, "flights")
lax_flights <- sql(sqlContext, "SELECT * from flights where ORIGIN = 'LAX' and DAY_OF_MONTH = 1")
head(lax_flights)

