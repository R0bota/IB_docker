#load libraries
library(RPostgreSQL)
#library(devtools)
#library(remotes)
#library(RPostgres)
#library(DBI)




getCredentials <- function(select){
 
  return(switch(select, 
                "user" = "user", 
                "password" = "pw", 
                "dbname" = "IB_docker",
                "host"="localhost",
                "port"= "1234",
                "schema"="-c search_path="))
  
}

getCredentials("port")


# functions
getTableQuery <- function(dbquery){
  
  db <- dbConnect(RPostgres::Postgres(), 
                  dbname=getCredentials("dbname"), 
                  host= getCredentials("host"), 
                  port= getCredentials("port"), 
                  user=getCredentials("user"), 
                  password=getCredentials("password"), 
                  options=getCredentials("schema"))
  
  df <- dbGetQuery(db,dbquery)
  
  return(df)
}


sendQUery <- function(dbquery){
  
  db <- dbConnect(RPostgres::Postgres(), 
                  dbname=getCredentials("dbname"), 
                  host= getCredentials("host"), 
                  port= getCredentials("port"), 
                  user=getCredentials("user"), 
                  password=getCredentials("password"), 
                  options=getCredentials("schema"))
  
  res <- dbSendQuery(db, dbquery)

  return()
  
}



